class CreateKegTypes < ActiveRecord::Migration
  def change
    create_table :keg_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
