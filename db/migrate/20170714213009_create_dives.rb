class CreateDives < ActiveRecord::Migration[5.1]
  def change 
    create_table :dives do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :date
      t.string :time
      t.integer :duration
      t.integer :ballast
      t.integer :max_depth
      t.integer :starting_pressure
      t.integer :final_pressure
      t.string :comments
    end
  end
end
