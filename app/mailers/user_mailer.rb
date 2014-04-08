class UserMailer < ActionMailer::Base
  default from: "no-replay@merseri.com"
  
  def welcome_email(user)
    @user = user
    @ari = 'ari.vuorenmaa@gmail.com'
    @info_subject = 'New user: '+@user.name
    @url  = 'https://www.merseri.com/'
    mail(to: @user.email, subject: 'Welcome using merseri')
  end
  
  def collection_email(mers, user)
    @user = user
    @mers = mers
    @url  = 'https://merseri.herokuapp.com/'
    mail(to: @user.email, subject: 'Collection')
  end
  
  def new_signup_notice(user)
    @user = user
    @admin = 'ari.vuorenmaa@gmail.com'
    @new_user_subject = 'New user: '+@user.name
    mail(to: @admin, subject: @new_user_subject)
  end
end
