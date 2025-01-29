class CommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(user, post, comment)
    UserMailer.comment_notification(user, post, comment).deliver_later
  end
end
