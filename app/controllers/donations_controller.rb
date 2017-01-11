class DonationsController < ApplicationController

	def index 
	end

	def new		
  	@donation = Donation.new
	end			

	def credit
		@donation = Donation.where(user_id: current_user.id)
	end
	
	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@donation = @restaurant.donations.new(donation_params)
		@donation.user_id = current_user.id
		@donation.amount -= 5
		respond_to do |format|
			if @donation.save
				format.html { redirect_to @restaurant, notice: "Thank you for giving and for supporting the community and donating! Your account now has the balance: #{amount_sum}"}
				format.js {}
				format.json {render json: @restaurant, status: :created, location: @restaurant}
		  else
				format.html { redirect_to @restaurant, notice: "Sorry, the associated account with email: #{current_user.email} has an account balance of #{amount_sum}"}
				format.js {}
				format.json { render json: @restaurant, notice: "Users are only able to donate once"}
			end
		end
	end

	private

	def donation_params
		params.require(:donation).permit(:amount)
	end

	def amount_sum
		# binding.pry
		# cleaned_num = ""
		# if current_user.donations.count >= 2 
			#something is happening here and its not allowing the default of 5 to work for new user
			# could it be the postion of this method? what is going ?
			# take out this method to diagnose
		#need to find a better why to check how many instance there are other then a guess range
		 @restaurant.donations.collect(&:amount)[0..50].inject(0){|sum,x| sum + x }

		  # if current_user.id.nil? && @donation != nil
		  #  @donation.user_id = current_user.id
    #   @donation.amount.to_i
    # end
	end
end
