# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  [1.32, "Mini Keg"],
  [5.0, "Corny Keg"],
  [5.23, "Sixth Barrel / Log"],
  [7.75, "Quarter Barrel / Pony"],
  [15.5, "Half Barrel / Full Keg"]
].each do |capacity, name| 
  KegType.create(:name => name, :capcity_in_gallons => capacity)
end

{
  "Long Trail" => [
    "Blackbeary Wheat"
  ],
  "Shipyard" => [
    "Pumpkinhead"
  ],
  "Newcastle" => [
    "Brown Ale"
  ]
}.each do |brewery, beers|
  Brewery.create(:name => brewery).tap do |brewery|
    beers.each do |beer|
      Beer.create(:name => beer, :brewery => brewery)
    end
  end
end
