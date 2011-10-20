class Keg < ActiveRecord::Base
  belongs_to :keg_type
  belongs_to :kegerator
  belongs_to :user, :through => :kegerator
end
