class VotesController < ApplicationController
	
  def new
	 @vote = Vote.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @vote = @restaurant.votes.new(vote_params)
    @vote.user_id = current_user.id
    respond_to do |format|
    	if @vote.save 
    	  format.html { redirect_to @restaurant, notice: "Thank you for your support!"}
    	  format.js {}
    	  format.json {render json: @restaurant, status: :created, location: @restaurant}
    	else
    	  format.html { redirect_to @restaurant, notice: "Only one like please"}
    	  format.js {}
        format.json { render json: @restaurant, notice: "Only one like please"}  				
        end
      end
    end

 private
	def vote_params
	  params.require(:vote).permit(:like)
	end
end
