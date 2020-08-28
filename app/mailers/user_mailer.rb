class UserMailer < ApplicationMailer
	default from: 'arpitsachdeva12@gmail.com'
 
  def confirmation_email
    @user = params[:user]
    mail(to: @user[:email], subject: 'Welcome to My Awesome Site')
  end
  def forgotpassword_email
    @user = params[:user]
    mail(to: @user[:email], subject: 'Welcome to My Awesome Site')
  end
end
