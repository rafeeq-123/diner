module RestaurantsHelper
	def default_image
  	if @restaurant.avatar_url(:thumb).to_s.empty?
			image_tag("/spain-image.jpg", :size => "200x200")
		else
			image_tag @restaurant.avatar_url(:thumb).to_s
		end
	end

	def iteration
		@location = {
			lat:37.7749, lng: 122.4194,
			lat:48.8566, lng:2.3522,
			lat:41.9028, lgn:12.4964,
		}
# https://www.youtube.com/watch?v=R0l-7en3dUw&feature=youtu.be to maybe use googlemaps api gem
  end

  def no_ticket_info
  	if @restaurant.availability.nil?
  		@restaurant.availability
  	else
  		"N/A"	
  	end
  end
end
