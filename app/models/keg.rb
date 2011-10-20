class Keg < ActiveRecord::Base
  belongs_to :keg_type
  belongs_to :kegerator
  has_one :user, :through => :kegerator
end
