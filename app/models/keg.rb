class Keg < ActiveRecord::Base
  OUNCES_IN_A_GALLON = 128
  OUNCES_IN_A_PINT = 16
  OUNCES_IN_A_SIXPACK = ( 12 * 6 )

  belongs_to :keg_type
  belongs_to :kegerator
  belongs_to :beer

  has_one :user, :through => :kegerator

  before_save :set_added_at

  scope :finished, where("finished_at IS NOT NULL")
  scope :not_finished, where("finished_at IS NULL")

  def finished?
    finished_at.present?
  end

  def days_lasted
    finished_at - added_at
  end

  def consumed_per_day( uom = :pint )
    (((keg_type.capacity_in_gallons * OUNCES_IN_A_GALLON) / days_lasted ) / (uom == :pint ? OUNCES_IN_A_PINT : OUNCES_IN_A_SIXPACK)).round
  end

  def had_beer_on?( date )
    (added_at..finished_at).cover?(date)
  end

  protected
    def set_added_at
      self.added_at = Time.now unless added_at.present?
    end
end
