class UserMailer < ApplicationMailer
  default from: "notifications@example.com"


  def welcome_email
    @user = params[:user]
    @url = "http://example.com/login"
    mail(to: @user.email,
    subject: "welcome to My Awesome Site",
     template_path: "notifications",
         template_name: "hello")
  end
end
