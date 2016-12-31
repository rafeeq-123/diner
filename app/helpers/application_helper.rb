module ApplicationHelper
	def user_has_stats?
		# binding.pry
		user_signed_in? && current_user.restaurants.any?
		
	end
end
