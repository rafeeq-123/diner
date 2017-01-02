module DonationsHelper
	def donation_bonus
	  current_user.donations.find_each{|u| u.update_attributes( amount: u.amount + 5)}
	end

	def donation_current_user_count
		current_user.donations.count
	end

end
