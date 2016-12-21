class Restaurant < ApplicationRecord
validates :name, presence: true
validates :description, presence: true	
belongs_to :user
mount_uploader :avatar, AvatarUploader
end
