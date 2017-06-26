class Restaurant < ApplicationRecord
  validates :name, :description, :event_time, presence: true
  validates :availability, numericality: { greater_than_or_equal_to: 1 }
  validates :avatar, presence:  { message: "You will need to pick a logo for your restaurant" }	
  belongs_to :user
  geocoded_by :address 
  after_validation :geocode
  mount_uploader :avatar, AvatarUploader
  has_many :votes, through: :users
  has_many :votes
  has_many :donations
  has_many :comments
end
