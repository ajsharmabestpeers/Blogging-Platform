class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to BloggingPlateform')
    end

    def post_created(user)
        @user = user
        mail(to: @user.email, subject: 'Your post was created successfully')
    end

    def comment_notification(user, post, comment)
        @user = user
        @post = post
        @comment = comment
        mail(to: @user.email, subject: 'New comment on your post')
    end
end
