module ApplicationHelper

	def user_has_stats?
		user_signed_in? && current_user.restaurants.any?
	end

	def ready_for_credit?
		#only ranging max  count of instances
		if user_signed_in? 
			current_user_count = current_user.donations.count
		  current_user.donations.collect(&:amount)[0..current_user_count].inject(0){|sum,x| sum + x } == 0 && 
		  user_vote && user_restaurant && user_donation
		else
			current_user
		end
	end

	def votes
		vote_array = current_user.votes.collect(&:likes)
		vote_array.inject(0){|sum,x| sum + x }
	end

	def donation_count
		#only ranging max  count of instances
		don_countable = @restaurant.donations.count
		@restaurant.donations.collect(&:amount)[0..don_countable].inject(0){|sum,x| sum + x }
	end

	def user_vote
		vote_count = current_user.votes.count
		(5..10).include?(vote_count) 
	end

	def user_restaurant
		restaurant_count = current_user.restaurants.count 
		(2..10).include?(restaurant_count) 
	end

	def user_donation
		#never letting a user have more than more than 2 donations
		donation_count = current_user.donations.count 
		(1..2).include?(donation_count)
	end
end
