class AddAmountToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :amount, :integer, :default => 5
    add_column :donations, :user_id, :integer
    add_column :donations, :restaurant_id, :integer
  end
end
