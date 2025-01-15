class Category < ApplicationRecord
    validates :name, presence: true,uniqueness: { message: "Title must be unique" }
    has_many :posts
end
