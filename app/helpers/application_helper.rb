module ApplicationHelper
	def user_has_stats?
		user_signed_in? && current_user.restaurants.any?
	end
end
