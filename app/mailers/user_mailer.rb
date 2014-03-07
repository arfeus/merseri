class UserMailer < ActionMailer::Base
  default from: "simo.siiseli@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'https://merseri.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to use merseri')
  end
  
end
