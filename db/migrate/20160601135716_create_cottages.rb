class CreateCottages < ActiveRecord::Migration
  def change
    create_table :cottages do |t|
      t.string :name
      t.string :color
      t.integer :sq_footage
      t.integer :price

      t.timestamps null: false
    end
  end
end
