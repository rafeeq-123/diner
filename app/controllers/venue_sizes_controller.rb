class VenueSizesController < ApplicationController

  def index
    @venue_sizes = Venue_Size.all
  end

  def new
    @venue_size = Venue_Size.new
  end

  def create
    @venue_size = Venue_Size.create(venue_size_params)
      if @venue_size.save
        redirect_to @venue_size
      else
        render new
    end
  end

  def show
    @venue_size = Venue_Size.find(params[:id])
  end

  private

  def venue_size_params
    params.require(:venue_size).permit(:availability, :capacity)
  end
end