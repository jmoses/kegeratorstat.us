class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :login, :email
  validates_presence_of :login

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login

  has_many :kegerators
  has_many :kegs, :through => :kegerators

  def drinking_stats( days_ago = 7 )
    start_date = days_ago.days.ago
    stop_date = Date.today

    kegs_full_in_range = kegs.where(:finished_at => (start_date..stop_date) )

    avg_consumption = average_daily_consumption

    days_ago.downto(0).inject([]) do |stats, days|
      date = days.days.ago.to_date
      
      stat = DailyStat.new(:date => date)

      stat.pints = kegs_full_in_range.select {|k| k.had_beer_on?(date) }.inject(0) {|pints, keg| pints + keg.consumed_per_day }
      if (tapped = tapped_kegs(date)).size > 0
        stat.pints += (tapped.size * avg_consumption)
        stat.guesstimate = true
      end


      stats << stat
    end
  end

  def average_daily_consumption( finished_kegs = kegs.finished.order(:finished_at).limit(10) )
    pints = finished_kegs.map(&:consumed_per_day)

    (pints.inject(0) {|sum, p| sum + p}.to_f / pints.size).ceil
  end
  # This needs to be a DB column, or memoized. This is probably a bitch of a data access call.

  def tapped_kegs_on?( date = Date.today )
    tapped_kegs(date).count > 0
  end

  def tapped_kegs( date = Date.today )
    kegs.not_finished_on(date)
  end

  
  def to_param
    login
  end

  def admin?
    email == 'jon@burningbush.us'
  end
end
