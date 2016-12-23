class Restaurant < ApplicationRecord
validates :name, presence: true
validates :description, presence: true	
validates :avatar, presence: true	
belongs_to :user
geocoded_by :address 
after_validation :geocode
mount_uploader :avatar, AvatarUploader
has_many :votes, :through => :users

end
