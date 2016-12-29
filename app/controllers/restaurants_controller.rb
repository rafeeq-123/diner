class RestaurantsController < ApplicationController
	
	def index
		@restaurants = Restaurant.order("created_at DESC").page(params[:page]).per(6)
	end

	def new
		@restaurant = Restaurant.new	
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

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :avatar, :address, :event_time, :availability, votes_attributes: [:id, :likes], donations_attributes: [:id, :amount])
	end

	def google_api
		Rails.application.secrets.google_api
	end
end
