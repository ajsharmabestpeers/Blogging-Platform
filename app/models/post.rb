class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  has_many :comments ,class_name: 'Comment',dependent: :destroy
  has_many_attached :post_images 

end
