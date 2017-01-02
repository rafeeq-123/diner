module ApplicationHelper

	def user_has_stats?
		user_signed_in? && current_user.restaurants.any?
	end

	def ready_for_credit?
		binding.pry
		#only ranging max  count of instances
		current_user_count = current_user.donations.count
		user_signed_in? &&
	  current_user.donations.collect(&:amount)[0..current_user_count].inject(0){|sum,x| sum + x } == 0 && 
	  user_vote && user_restaurant && user_donation
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
		vote_count == [5..8]|| vote_count == [8..15]
	end

	def user_restaurant
		restaurant_count = current_user.restaurants.count 
		restaurant_count == [5..10] || restaurant_count == [20..25]
	end

	def user_donation
		donation_count = current_user.donations.count 
		donation_count == 1 || donation_count ==  2	
	end
end
