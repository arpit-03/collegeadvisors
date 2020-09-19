class UserMailer < ApplicationMailer
	default from: 'infocollegeadvisors@gmail.com'
 
  def confirmation_email
    @user = params[:user]
    mail(to: @user[:email], subject: 'Confirmation of Registration')
  end
  def forgotpassword_email
    @user = params[:user]
    mail(to: @user[:email], subject: 'Password Reset')
  end
  def bookconfirmation_email
  	@slot= params[:slot]
  	@user=User.find(@slot[:user_id])
  	@adminslot=Adminslot.find(@slot[:slot_id])
  	email= User.find(@slot[:user_id]).email
  	mail(to: email, subject: 'Book Reciept')
  end

  def unbooknotification_email
    @data= params[:data]
    mail(to: @data[:email], subject: 'Slot Unbook Notification')
  end
  def bookconfirm_email
@user= params[:user]
mail(to: @user[:email], subject: "Payment Successfull")
  end
end
