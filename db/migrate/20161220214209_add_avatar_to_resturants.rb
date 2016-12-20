class AddAvatarToResturants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :avatar, :string
  end
end
