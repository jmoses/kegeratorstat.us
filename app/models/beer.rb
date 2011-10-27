class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :kegs

  def to_s
    "#{brewery.name}: #{name}"
  end
end
