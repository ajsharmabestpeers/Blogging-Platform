class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to BloggingPlateform')
    end

    def post_created(user)
        @user = user
        mail(to: @user.email, subject: 'Your post was created successfully')
    end
end
