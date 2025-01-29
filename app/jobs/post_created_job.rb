class PostCreatedJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    UserMailer.post_created(user).deliver
  end
end
