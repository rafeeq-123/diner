class ChangeVoteTable < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :votes, :likes, :integer
  end
end
