class VenueSize < ApplicationRecord
  belongs_to :restaurant, required: false
end
