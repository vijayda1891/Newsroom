class UserMailer < ApplicationMailer
    include Rails.application.routes.url_helpers

    def welcome_email(user)
        @user = user
        @url = new_user_session_path
        mail(to: @user.email, subject: "Welcome to Newsroom!")
    end
end
