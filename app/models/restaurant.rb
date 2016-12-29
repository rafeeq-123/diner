class Restaurant < ApplicationRecord
validates :name, :description, :event_time, :availability, presence: true
validates :avatar, presence:  { message: "You will need to pick a logo for your restaurant" }	
belongs_to :user
geocoded_by :address 
after_validation :geocode
mount_uploader :avatar, AvatarUploader
has_many :votes, through: :users
has_many :votes
has_many :donations
end
