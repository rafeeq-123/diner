class Donation < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	validates_uniqueness_of :user_id, :unless => :ready_for_credit? 
	validates :amount, numericality: { greater_than_or_equal_to: 0 }

	def ready_for_credit?
		#only ranging max  count of instances
		don_countable = user.donations.count
		user.donations.collect(&:amount)[0..don_countable].inject(0){|sum,x| sum + x } == 0 && 
		user_vote && user_restaurant && user_donation
	end

	def user_vote
		binding.pry
		vote_count = user.votes.count
		(1..10).include?(vote_count) 
	end

	def user_restaurant
		restaurant_count = user.restaurants.count 
		(1..10).include?(restaurant_count) 
	end

	def user_donation
		donation_count = user.donations.count 
		donation_count == (1||2)
	end
end
