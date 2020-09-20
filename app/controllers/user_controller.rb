class UserController < ApplicationController
  def index
  end
  def login
  end
  def signup
  end
  def signupsave

  end
  def createsession
session[:user_id]=params[:user_id]
session[:username]=params[:username]
redirect_to root_path
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
    redirect_to root_path
  else
      redirect_to errorvar_path
    end
  
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
