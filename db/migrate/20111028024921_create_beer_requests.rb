class CreateBeerRequests < ActiveRecord::Migration
  def change
    create_table :beer_requests do |t|
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
