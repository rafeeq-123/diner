class AddKeyToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :restaurant_id, :integer
  end
end
