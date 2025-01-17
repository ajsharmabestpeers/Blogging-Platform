class Post < ApplicationRecord
  include Searchable
  belongs_to :user
  validates :title, presence: true, uniqueness:{ message: "Title must be unique" }
  validates :body, presence: true, length: { minimum: 10 }
  has_many :comments ,class_name: 'Comment',dependent: :destroy
  has_many_attached :post_images  
  belongs_to :category
  
  def next
    Post.where("id > ?", id).order(id: :asc).limit(1).first
  end

  def prev
    Post.where("id < ?", id).order(id: :desc).limit(1).first
  end
  
end
