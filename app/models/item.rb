class Item < ActiveRecord::Base
resourcify
include Authority::UserAbilities
mount_uploader :image, AvatarUploader

  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
end
