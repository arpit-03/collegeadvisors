class UserController < ApplicationController
  def index
  end
  def login
  end
  def signup
  end
  def signupsave

  end
  def createsession(a,b)
session[:user_id]=a
session[:username]=b
  end
  def forgotpassword
    @id= params[:id]
    @name= User.find(@id).name
    @email=User.find(@id).email
  end
  def fpassconf
  end
  def updateuser
    @user=User.find(session[:user_id])
  end
  def verify
    id=params[:email]
    token = params[:token]
    if(User.find(id).verification_token==token)
      User.find(id).update(verified: true)
    session[:user_id]=id
    session[:username]= User.find(id).name
    end
    redirect_to root_path
  end
  def updatechangesinuser
    if params[:password]==""
    User.find_by(email: params[:user][:email]).update(name: params[:user][:name],background: params[:user][:background],interest: params[:user][:interest], number: params[:user][:number], mothername: params[:user][:mothername],mothercontact: params[:user][:mothercontact],fathername: params[:user][:fathername],fathercontact: params[:user][:fathercontact])
    else
 User.find_by(email: params[:user][:email]).update(name: params[:user][:name],password: params[:user][:password],interest: params[:user][:interest],background: params[:user][:background], number: params[:user][:number], mothername: params[:user][:mothername],mothercontact: params[:user][:mothercontact],fathername: params[:user][:fathername],fathercontact: params[:user][:fathercontact])
   
    end
redirect_to updateuser_path
  end
  def signout
    session.delete(:user_id)
    session.delete(:username)
    redirect_to root_path
  end
  def showslots
   @adminslots= Adminslot.where(user_id: session[:user_id]).order('slot desc')
  end
end
