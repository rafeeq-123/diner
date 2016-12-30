class AddDefaultToVotes < ActiveRecord::Migration[5.0]
  def change
  	change_column :votes, :likes, :integer, :default => 0
  end
end
