class AddKeyAddedAt < ActiveRecord::Migration
  def up
    add_column :kegs, :added_at, :date
    add_column :kegs, :finished_at, :date
  end

  def down
    remove_column :kegs, :added_at, :finished_at
  end
end
