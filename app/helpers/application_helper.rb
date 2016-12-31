module ApplicationHelper

	def user_has_stats?
		user_signed_in? && current_user.restaurants.any?
	end

	def ready_for_credit?
		#change votes to 4 after adding funtionality
		user_signed_in? && donation_count == 0 && votes >= 1 && current_user.restaurants.count >= 2
	end

	def votes
		array = current_user.votes.collect(&:likes)
		array.inject(0){|sum,x| sum + x }
	end

	def donation_count
		current_user.donations.collect(&:amount)[0]
	end
end
