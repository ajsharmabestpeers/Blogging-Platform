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
  
  require 'csv'

  def self.to_csv
    posts = all
      CSV.generate(headers: true) do |csv|
    csv << ['id', 'title', 'author_email', 'comments_count']
    posts.each do |post|
      csv << [post.id, post.title, post.user.email, post.comments.count]
    end
  end
end
end
