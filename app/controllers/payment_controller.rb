class PaymentController < ApplicationController
def calchash
  		data = 	params[:key] + "|" + params[:txnid] + "|" + params[:amount] +"|" + params[:pinfo] + "|" + params[:fname] + "|" + params[:email] + "||||||" + params[:salt]
  		hash=Digest::SHA512.hexdigest(data)
		
  		respond_to do |format|
      		format.json { render :json => {:success => hash} }
    	end
  	end
  
  
 
end
