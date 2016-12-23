class AddEventTimeToRestaurant < ActiveRecord::Migration[5.0]
  def change
  	add_column :restaurants, :event_time, :datetime
  end
end
