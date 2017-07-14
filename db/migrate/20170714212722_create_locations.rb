class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :category
      t.string :description
      t.string :name
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
