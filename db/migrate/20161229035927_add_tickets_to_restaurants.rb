class AddTicketsToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :availability, :integer
  end
end
