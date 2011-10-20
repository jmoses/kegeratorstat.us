class Kegerator < ActiveRecord::Base
  belongs_to :user
  has_many :kegs
end
