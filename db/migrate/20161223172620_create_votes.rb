class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
    	t.belongs_to :user
    	t.belongs_to :restaurant
    	t.integer :likes, :default => 1
      t.timestamps
    end
  end
end
