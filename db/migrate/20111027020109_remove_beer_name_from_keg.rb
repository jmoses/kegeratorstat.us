class RemoveBeerNameFromKeg < ActiveRecord::Migration
  def up
    remove_column :kegs, :beer_name
    add_column :kegs, :beer_id, :integer
  end

  def down
    add_column :kegs, :beer_name, :string
    remove_column :kegs, :beer_id
  end
end
