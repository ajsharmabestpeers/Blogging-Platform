class Profile < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :imageable
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, length: { is: 10 }, numericality: { only_integer: true }, allow_blank: true
  validates :interest, presence: true, length: { maximum: 200 }
  validates :age, presence: true, numericality: { only_integer: true}
  validates :dob, presence: true
  validates :city, presence: true, length: { maximum: 10 }
  validates :bio, length: { maximum: 500 }, allow_blank: true
end
