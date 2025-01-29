class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true, length: { minimum: 2 }

  after_create :send_comment_notification

  private

  def send_comment_notification
    # CommentNotificationJob.perform_later(post.user, post, self)
    CommentNotificationJob.set(wait: 1.seconds).perform_later(post.user, post, self)
  end
end
