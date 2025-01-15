class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness:{ message: "Title must be unique" }
  
  validates :body, presence: true, length: { minimum: 10 }
  has_many :comments ,class_name: 'Comment',dependent: :destroy
  has_many_attached :post_images  
  belongs_to :category
  
end
