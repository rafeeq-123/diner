class DonationsController < ApplicationController

  def index
  end

  def new
    @donation = Donation.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @donation = @restaurant.donations.new(donation_params)
    @donation.user_id = current_user.id
    @donation.decrement(:amount, by = 5)
      respond_to do |format|
      if @donation.save
        format.html { redirect_to @restaurant, notice: "Thank you for giving and for supporting the community and donating!"}
        format.js {}
        format.json {render json: @restaurant, status: :created, location: @restaurant}
      else
        format.html { redirect_to @restaurant, notice: "The associated account with email #{current_user.email} now has #{@donation.amount - 5 } cerdits to give"}
        format.js {}
        format.json { render json: @restaurant, notice: "Users are only able to donate once"}
        end         
      end
    end

  private
  def donation_params
    params.require(:donation).permit(:amount)
  end
end
