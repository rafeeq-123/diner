class CreateVenueSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :venue_sizes do |t|
      t.string :availability
      t.integer :capacity
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
