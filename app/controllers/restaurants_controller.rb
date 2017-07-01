class RestaurantsController < ApplicationController
	
	def index
		@restaurants = Restaurant.order("created_at DESC").page(params[:page]).per(6)
	end

	def new
		@restaurant = Restaurant.new	
		@restaurant.venue_sizes.build
	end

	def create
		@restaurant = current_user.restaurants.new(restaurant_params)
		if @restaurant.save
			redirect_to @restaurant
		else
			render "new"	
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def user_stats
  	@restaurant = Restaurant.where(user_id: current_user.id)
  	@vote = Vote.where(user_id: current_user.id)
  	@donation = Donation.where(user_id: current_user.id)
	end

	def more_info
		render "more_info"
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :avatar, :address, :event_time, :votes_attributes => [:likes], :donations_attributes => [:amount], :venue_sizes_attributes => [:availability, :capacity])
	end

	def google_api
		Rails.application.secrets.google_api
	end
end