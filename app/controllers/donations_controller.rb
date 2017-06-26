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
				format.html { redirect_to @restaurant, notice: "Sorry, the associated account with email: #{current_user.email} has an account balance of "}
				format.js {}
				format.json { render json: @restaurant, notice: "Users are only able to donate once"}
			end
		end
	end

	def update
	end

	private

	def donation_params
		params.require(:donation).permit(:amount)
	end
end