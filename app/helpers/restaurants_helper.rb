module RestaurantsHelper
	def default_image
  	if @restaurant.avatar_url(:thumb).to_s.empty?
			image_tag("/spain-image.jpg", :size => "200x200")
		else
			image_tag @restaurant.avatar_url(:thumb).to_s
		end
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
 		vote_array = @vote.collect(&:likes)
		vote_array.inject(0){|sum,x| sum + x }
	end

	def activity
		if last_restaurant_created < 30.minutes.ago && @restaurant.count >= 1 && votes_count >= 5
			"VERY active"
		elsif last_restaurant_created ==  Date.today && @restaurant.count >= 1 && votes_count >= 3
			"Active"
		else
			"Not very active"	
	  end
  end

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
		vote = Vote.all
		@all_votes = vote.count
	end

	def vote_num
		@numv = votes_count
	end

end
