class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :blogs
    has_many :favorites
    has_many :likes, through: :favorites, source: :blog
    
  def favorite(other_user_blog)
      self.favorites.find_or_create_by(blog_id: other_user_blog.id)
  end
  
  def unfavorite(other_user_blog)
    favorite = self.favorites.find_by(blog_id: other_user_blog.id)
    favorite.destroy if favorite
  end
    
  def likes?(other_user_blog)
    self.likes.include?(other_user_blog)
  end
    
    
end
