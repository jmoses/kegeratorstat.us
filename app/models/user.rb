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

    days_ago.downto(0).inject([]) do |stats, days|
      date = days.days.ago.to_date
      stats << kegs_full_in_range.select {|k| k.had_beer_on?(date) }.inject(0) {|pints, keg| pints + keg.consumed_per_day }
    end
  end

  def to_param
    login
  end

  def admin?
    email == 'jon@burningbush.us'
  end
end
