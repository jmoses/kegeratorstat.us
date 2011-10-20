class AddCapcityToKegTypes < ActiveRecord::Migration
  def change
    add_column :keg_types, :capacity_in_gallons, :float, :precision => 2
  end
end
