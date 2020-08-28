class AdminController < ApplicationController
before_action :authorize_admin , except:[:login,:logincheck]
  def index
      @c1=Defaultparam.find(1)
    @c2=Defaultparam.find(2)
    @c3=Defaultparam.find(3)
    @c4=Defaultparam.find(4)
    @adminslot= Adminslot.all
  end
  def login
  end
  def logincheck
  	if (Admin.find_by(username: params[:username]))
  	if(Admin.find_by(username: params[:username]).password==params[:password])
  		session[:admin_id]= Admin.find_by(username: params[:username]).id
  		  		session[:admin_username]= Admin.find_by(username: params[:username]).username
  		  		redirect_to adminindex_path
  	end
  	else
  		return "error"
  	end

  end

def logout
session.delete(:admin_id)
session.delete(:admin_username)
redirect_to adminlogin_path
end

def changedefaults
  c4= Defaultparam.find(4).update(typeplan: params[:defaultparam][:typeplan])
    redirect_to adminindex_path 
end

def createslots
  if(Adminslot.find_by(slot:params[:slotime]).present?)
 else
  Adminslot.create(admin_id:session[:admin_id],slot: params[:slotime] )
  end
  redirect_to adminindex_path
end
def updateslots
end
def bookslots
end
def updatec1
  
  c1= Defaultparam.find(1).update(typeplan: params[:defaultparam][:typeplan], price: params[:defaultparam][:price], numsession: params[:defaultparam][:numsession], line1: params[:defaultparam][:line1] ,line2: params[:defaultparam][:line2],line3: params[:defaultparam][:line3],line4: params[:defaultparam][:line4])
redirect_to adminindex_path  
end
def updatec2
c2= Defaultparam.find(2).update(typeplan: params[:defaultparam][:typeplan], price: params[:defaultparam][:price], numsession: params[:defaultparam][:numsession], line1: params[:defaultparam][:line1] ,line2: params[:defaultparam][:line2],line3: params[:defaultparam][:line3],line4: params[:defaultparam][:line4])
redirect_to adminindex_path  
end
def updatec3
  c3= Defaultparam.find(3).update(typeplan: params[:defaultparam][:typeplan], price: params[:defaultparam][:price], numsession: params[:defaultparam][:numsession], line1: params[:defaultparam][:line1] ,line2: params[:defaultparam][:line2],line3: params[:defaultparam][:line3],line4: params[:defaultparam][:line4])
redirect_to adminindex_path  
end

def authorize_admin
if(!session[:admin_id])
  redirect_to adminlogin_path
end
  end


  def slotview
@slot= Adminslot.find(params[:id])
if(@slot.user_id)
@user= User.find(@slot.user_id)
end
  end

end
