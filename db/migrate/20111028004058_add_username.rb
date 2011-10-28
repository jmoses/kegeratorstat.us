class AddUsername < ActiveRecord::Migration
  def up
    add_column :users, :login, :string
  end

  def down
    remove_column :users, :login
  end
end
