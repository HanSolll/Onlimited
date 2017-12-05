class Item < ActiveRecord::Base
resourcify
include Authority::UserAbilities
mount_uploader :image, AvatarUploader
has_and_belongs_to_many :tags
  after_create do
      item = Item.find_by(id: self.id)
      hashtags = self.content.scan(/#\w+/)
      hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        item.tags << tag
      end
  
    end
  
  before_update do
    item = Item.find_by(id: self.id)
    item.tags.clear #delete all and add again
    hashtags = self.content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      item.tags << tag
    end

  end
  
  def self.search(search)
    
    if search
      find(:all, :conditions => ['content LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end  
end
