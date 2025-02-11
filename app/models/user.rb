class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments , dependent: :destroy
  has_one :profile, dependent: :destroy
  
  has_many :pictures, as: :imageable
  
  has_one_attached :image
  
  enum role: %i[reader author admin]
  after_initialize :set_default_role, if: :new_record?
  
  after_create :send_welcome_email

  private 
  
  def set_default_role
    self.role ||= :reader
  end
  
  # def send_welcome_email
  #   # UserMailer.welcome_email(self).deliver_later
  #   # UserMailer.welcome_email(self).deliver_now
  # end

  def send_welcome_email
    # SendEmailsJob.perform_later(self).deliver_now
    SendEmailsJob.set(wait: 1.seconds).perform_later(self)
  end
end
