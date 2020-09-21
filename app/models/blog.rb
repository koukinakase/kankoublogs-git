class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  
  validates :spot_name, presence: true, length: { maximum: 70}
  validates :content, presence: true, length: { maximum: 1000 }
end
