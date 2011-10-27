class Keg < ActiveRecord::Base
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

  protected
    def set_added_at
      self.added_at = Time.now unless added_at.present?
    end
end
