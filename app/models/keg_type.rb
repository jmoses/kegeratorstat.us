class KegType < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :kegs
end
