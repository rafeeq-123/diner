class CommentsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comments = @restaurant.comments
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.create(comment_params)
    respond_to do |format|  
      if @comment.save
        format.html { redirect_to @restaurant, notice: "Thank you for giving and for supporting the community!"}
        format.js {}
        format.json {render json: @restaurant, status: :created, location: @restaurant}
      else
        format.html { redirect_to @restaurant, notice: "Sorry, the associated account with email: #{current_user.email} has an account balance of "}
        format.js {}
        format.json { render json: @restaurant, notice: "Users are only ab"}
      end
    end
  end

  def show
    # binding.pry
    @restaurant = Restaurant.find(params[:id])
    # @restaurant.comments = Restaurant.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body)
  end

end
