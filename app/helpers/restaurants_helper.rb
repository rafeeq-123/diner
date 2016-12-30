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

  def online
		if user_signed_in?
		 "Online"
		else
			"Not Online and you should not be here, contact developer"
		end
	end
	
	def votes_count
		array = @vote.collect(&:likes)
		array.inject(0){|sum,x| sum + x }
	end

	def activity
		if last_restaurant_created < 1.hours && @restaurant.count >= 1 && votes_count >= 5
			"VERY active"
		elsif last_restaurant_created ==  Date.today && @restaurant.count >= 1 && votes_count >= 3
			"Active"
		else
			"Not very active"	
	  end
  end

	private

	def last_restaurant_created
		last_time = @restaurant.last
		last_time.created_at
	end

	def num
		num = @restaurant.count 
		@num = num
	end

	def all_restaurant
		restaurant = Restaurant.all
	  @num_res = restaurant.count
	end

	def all_votes
		binding.pry
		vote = Vote.all
	end
end
