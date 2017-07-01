class DropAvailablityFromRestuarants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :availability
  end
end
