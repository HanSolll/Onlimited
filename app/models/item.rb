class Item < ActiveRecord::Base
resourcify
include Authority::UserAbilities
mount_uploader :image, AvatarUploader

end
