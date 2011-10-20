class CreateKegs < ActiveRecord::Migration
  def change
    create_table :kegs do |t|
      t.integer :keg_type_id
      t.integer :kegerator_id
      t.string :beer_name

      t.timestamps
    end
  end
end
