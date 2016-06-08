class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :year_est
      t.integer :population
      t.string :schools_rank

      t.timestamps null: false
    end
  end
end
