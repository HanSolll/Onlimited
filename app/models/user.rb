class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :set_default_role, if: Proc.new { User.count > 1 }
  has_many :items
  has_many :likes
  has_many :liked_items, through: :likes, source: :item
  
  # 어떤 사용자에 대해서 이 사용자가 특정한 글을 좋아요 했는지 안했는지 체크하는
  #(post)를 좋아요 했으면 true, 안했으면 false
  #self 는 current user를 뜻함.
  def is_like?(item)
    Like.find_by(user_id: self.id, item_id: item.id).present?
  end
  
  private

  def set_default_role
    add_role :user
  end
  
end
