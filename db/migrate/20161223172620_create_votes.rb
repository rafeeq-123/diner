class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
    	t.belongs_to :user
    	t.belongs_to :restaurant
    	t.integer :likes
      t.timestamps
    end
  end
end
