module Api 
	module V1 
        class PaymentController< ApplicationController 
        	  skip_before_action :verify_authenticity_token
             def confirmed1
    s= Defaultparam.find(params[:pid])
    User.find(session[:user_id]).update(subscription: true,subtype: s.typeplan,slotsleft: s.numsession )
 user=User.find(session[:user_id])
 UserMailer.with(user: user).bookconfirm_email.deliver_later
 redirect_to confirmed_path
  end
  def failed1
    User.find(session[:user_id]).update(txnid: nil)
    redirect_to failed_path
  end
        	def calchash
  				txnid= SecureRandom.uuid
		User.find(params[:id]).update(txnid: txnid)
  			data = 	params[:key] + "|" + txnid + "|" + params[:amount] +"|" + params[:pinfo] + "|" + params[:fname] + "|" + params[:email] + "|||||||||||" + params[:salt]
  	hash=Digest::SHA512.hexdigest(data)

  		respond_to do |format|
      		format.json { render :json => {
      			success: true,
      			txnid: txnid,
      			hash: hash
      		} }
    	end
  	end
  
  	def callback 	# to be called by PayU to post response
  		@key = params[:key]
  		@salt = params[:salt]
  		@txnid = params[:txnid]
  		@amount = params[:amount]
  		@pinfo = params[:productinfo]
  		@fname = params[:firstname]
  		@email = params[:email]
  		@udf5 = params[:udf5]
  		@mihpayid = params[:mihpayid]
  		@status = params[:status]
  		@hash = params[:hash]
  		
  		# Verify response hash
		data = "|||||" + @udf5 + "|||||" + @email + "|" + @fname + "|" + @pinfo + "|" + @amount + "|" + @txnid + "|" + @key 
		
		@CalcHash 	= Digest::SHA512.hexdigest(@salt + "|" + @status + "|" + data)
	
		@msg = "Payment failed for Hasn not verified..."

		if @status === "success"  && @hash === @CalcHash
			@msg = "Transaction Successful and Hash Verified..."
		end
 	end 
        	end
        end
    end