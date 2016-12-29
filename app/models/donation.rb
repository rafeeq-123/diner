class Donation < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	validates_uniqueness_of :user_id
end
