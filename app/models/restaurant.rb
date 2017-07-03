class Restaurant < ApplicationRecord
  validates :name, :description, :event_time, presence: true
  validates :description, :length => {:maximum   => 150}
  validates :avatar, presence:  { message: "You will need to pick a logo for your restaurant" }	
  belongs_to :user
  geocoded_by :address 
  after_validation :geocode
  mount_uploader :avatar, AvatarUploader
  has_many :votes, through: :users
  has_many :votes
  has_many :donations
  has_many :comments
  has_many :venue_sizes
  # accepts_nested_attributes_for :venue_sizes

  def venue_sizes_attributes=(venue_sizes_attributes)
    venue_sizes_attributes.values.each do |venue_size_attributes|
      self.venue_sizes.find_or_initialize_by(venue_size_attributes)
    end
  end
end
