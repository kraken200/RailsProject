class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      
      t.string :city
      t.string :stadium
      t.integer :capacity
      t.timestamps
    end
  end
end
