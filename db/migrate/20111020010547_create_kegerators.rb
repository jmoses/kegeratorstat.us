class CreateKegerators < ActiveRecord::Migration
  def change
    create_table :kegerators do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
