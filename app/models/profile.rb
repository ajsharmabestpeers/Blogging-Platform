class Profile < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :imageable
  has_one_attached :image
end
