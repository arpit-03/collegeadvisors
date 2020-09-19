module Api 
	module V1 
        class LoginuserController< ApplicationController 
        	  skip_before_action :verify_authenticity_token
       def login
       	 
       	 if (User.find_by(email: params[:username]))
  	if(User.find_by(email: params[:username]).password==params[:password])
  	
    	if(User.find_by(email: params[:username]).verified==true)
     
      session[:user_id]= User.find_by(email: params[:username]).id
  		  		session[:username]= User.find_by(email: params[:username]).name
  
      return render json:{ msg: "success"}
    else
return render json:{ msg: "User not verified"}
    end

       end
   
else
       return render json:{ msg: "error"}
end
       end


       def signupuser
           	token=SecureRandom.uuid
            if(!User.find_by(email: params[:email]))
           u=	User.create(name: params[:name], email: params[:email], password: params[:password], interest: params[:college], number: params[:phone], gender: params[:gender], background: params[:background] , fathername: params[:fathername], fathercontact: params[:fatherno], mothername: params[:mothername], mothercontact: params[:motherno],verified: false, verification_token: token)
       	@user={
          id: u.id,
       		name: params[:name],
       		email: params[:email],
       		token: token
       	}
       	 UserMailer.with(user: @user).confirmation_email.deliver_later
       	
return render json:{ msg: "success"}
elsif (User.find_by(email: params[:email]) && User.find_by(email: params[:email]).verified==false)
    u=  User.create(name: params[:name], email: params[:email], password: params[:password], interest: params[:college], number: params[:phone], gender: params[:gender], background: params[:background] , fathername: params[:fathername], fathercontact: params[:fatherno], mothername: params[:mothername], mothercontact: params[:motherno],verified: false, verification_token: token)
        @user={
          id: u.id,
          name: params[:name],
          email: params[:email],
          token: token
        }
         UserMailer.with(user: @user).confirmation_email.deliver_later
        
return render json:{ msg: "success"}
else
  return render json:{ msg: "Error occured"}
  end
       end
def confirmforgot
email = params[:email]
elem = User.find_by(email: email)
if(elem)
  link=SecureRandom.uuid
   User.find_by(email: email).update(verification_token: link)
@user={
  id: elem.id,
  name: elem.name,
  email: elem.email,
  token: link
}
UserMailer.with(user: @user).forgotpassword_email.deliver_later
return render json:{ msg: "success"}
else
return render json:{ msg: "User do no exists"}
end
end
def changepassword
password= params[:password]
id=params[:id]
if(User.find(id))
User.find(id).update(password: password)
return render json:{ msg: "success"}
else
return render json:{ msg: "User do no exists"}
end
end

def resend
end
        end
    end
end