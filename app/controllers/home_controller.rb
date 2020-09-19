class HomeController < ApplicationController
  before_action :authorize_user , except:[:index,:show,:search,:about]
  def index
   
    @c1=Defaultparam.find(1)
    @c2=Defaultparam.find(2)
    @c3=Defaultparam.find(3)
  end

def about
end
def errorvar
  end
    def show

    	@current_stream=params[:stream]
    	if(params[:degree] && params[:order])
    		if(params[:degree]!="all")
    			if(params[:order]=="normal")
  @cname= College.joins('INNER JOIN courses ON colleges.id = courses.table_id').where(params[:stream]+' = true AND courses.degree = ?',params[:degree]).distinct('colleges.name').paginate(page: params[:page], per_page: 30)
else
@cname= College.joins('INNER JOIN courses ON colleges.id = courses.table_id').where(params[:stream]+' = true AND courses.degree = ?',params[:degree]).distinct('colleges.name').order('colleges.name '+params[:order]).paginate(page: params[:page], per_page: 30)	
end
else
	if (params[:order]=="normal")
@cname= College.where(params[:stream]+' = true').paginate(page: params[:page], per_page: 30)
else
@cname= College.where(params[:stream]+' = true').paginate(page: params[:page], per_page: 30).order('name '+params[:order])
end
end
else
  @cname= College.where(params[:stream]+' = true').paginate(page: params[:page], per_page: 30)
  
end

sql= "Select count(distinct(colleges.id)), courses.degree from colleges inner join courses on colleges.id=courses.table_id where "+params[:stream]+"=true group by courses.degree order by count desc"
@degree1= ActiveRecord::Base.connection.execute(sql)

@count = College.where(params[:stream]+' = true').count()

  end




def index1
end




def search
@query=params[:query]
if(params[:degree] && params[:order])


if(params[:degree]=="all")


if(params[:order]=="normal")
@cname= College.where("name LIKE '%#{@query.titlecase}%' OR name LIKE '%#{@query.downcase}%' OR name LIKE '%#{@query.upcase}%' OR location LIKE '%#{@query.titlecase}%' OR location LIKE '%#{@query.downcase}%' OR location LIKE '%#{@query.upcase}%'  OR facts LIKE '%#{@query.titlecase}%' OR facts LIKE '%#{@query.upcase}%' OR facts LIKE '%#{@query.downcase}%' OR facts_table LIKE '%#{@query.titlecase}%' OR facts_table LIKE '%#{@query.upcase}%' OR facts_table LIKE '%#{@query.downcase}%'").paginate(page: params[:page], per_page: 30)
else
@cname= College.where("name LIKE '%#{@query.titlecase}%' OR name LIKE '%#{@query.downcase}%' OR name LIKE '%#{@query.upcase}%' OR location LIKE '%#{@query.titlecase}%' OR location LIKE '%#{@query.downcase}%' OR location LIKE '%#{@query.upcase}%'  OR facts LIKE '%#{@query.titlecase}%' OR facts LIKE '%#{@query.upcase}%' OR facts LIKE '%#{@query.downcase}%' OR facts_table LIKE '%#{@query.titlecase}%' OR facts_table LIKE '%#{@query.upcase}%' OR facts_table LIKE '%#{@query.downcase}%'").order('name '+params[:order]).paginate(page: params[:page], per_page: 30)

end


else

 if(params[:order]=="normal")
 @cname= College.joins('INNER JOIN courses ON colleges.id = courses.table_id').where("courses.degree = '"+params[:degree]+"' AND (colleges.name LIKE '%#{@query.titlecase}%' OR colleges.name LIKE '%#{@query.downcase}%' OR colleges.name LIKE '%#{@query.upcase}%' OR colleges.location LIKE '%#{@query.titlecase}%' OR colleges.location LIKE '%#{@query.downcase}%' OR colleges.location LIKE '%#{@query.upcase}%'  OR colleges.facts LIKE '%#{@query.titlecase}%' OR colleges.facts LIKE '%#{@query.upcase}%' OR colleges.facts LIKE '%#{@query.downcase}%' OR colleges.facts_table LIKE '%#{@query.titlecase}%' OR colleges.facts_table LIKE '%#{@query.upcase}%' OR colleges.facts_table LIKE '%#{@query.downcase}%')").distinct('colleges.name').paginate(page: params[:page], per_page: 30)

 else
 @cname= College.joins('INNER JOIN courses ON colleges.id = courses.table_id').where("courses.degree = '"+params[:degree]+"' AND (colleges.name LIKE '%#{@query.titlecase}%' OR colleges.name LIKE '%#{@query.downcase}%' OR colleges.name LIKE '%#{@query.upcase}%' OR colleges.location LIKE '%#{@query.titlecase}%' OR colleges.location LIKE '%#{@query.downcase}%' OR colleges.location LIKE '%#{@query.upcase}%'  OR colleges.facts LIKE '%#{@query.titlecase}%' OR colleges.facts LIKE '%#{@query.upcase}%' OR colleges.facts LIKE '%#{@query.downcase}%' OR colleges.facts_table LIKE '%#{@query.titlecase}%' OR colleges.facts_table LIKE '%#{@query.upcase}%' OR colleges.facts_table LIKE '%#{@query.downcase}%')").distinct('colleges.name').order('colleges.name '+params[:order]).paginate(page: params[:page], per_page: 30)

 end 

end

else
  @cname= College.where("name LIKE '%#{@query.titlecase}%' OR name LIKE '%#{@query.downcase}%' OR name LIKE '%#{@query.upcase}%' OR location LIKE '%#{@query.titlecase}%' OR location LIKE '%#{@query.downcase}%' OR location LIKE '%#{@query.upcase}%'  OR facts LIKE '%#{@query.titlecase}%' OR facts LIKE '%#{@query.upcase}%' OR facts LIKE '%#{@query.downcase}%' OR facts_table LIKE '%#{@query.titlecase}%' OR facts_table LIKE '%#{@query.upcase}%' OR facts_table LIKE '%#{@query.downcase}%'").paginate(page: params[:page], per_page: 30)

end







if(params[:page]==nil || params[:page]==1)
sql= "CREATE OR REPLACE VIEW lists AS SELECT COUNT(DISTINCT(colleges.id)),courses.degree FROM colleges INNER JOIN courses ON colleges.id=courses.table_id WHERE colleges.name LIKE '%#{@query.titlecase}%' OR colleges.name LIKE '%#{@query.downcase}%' OR colleges.name LIKE '%#{@query.upcase}%' OR colleges.location LIKE '%#{@query.titlecase}%' OR colleges.location LIKE '%#{@query.downcase}%' OR colleges.location LIKE '%#{@query.upcase}%'  OR colleges.facts LIKE '%#{@query.titlecase}%' OR colleges.facts LIKE '%#{@query.upcase}%' OR colleges.facts LIKE '%#{@query.downcase}%' OR colleges.facts_table LIKE '%#{@query.titlecase}%' OR colleges.facts_table LIKE '%#{@query.upcase}%' OR colleges.facts_table LIKE '%#{@query.downcase}%' GROUP BY courses.degree ORDER BY count DESC"
 ActiveRecord::Base.connection.exec_query(sql)

end


@degree1= ActiveRecord::Base.connection.exec_query("Select * from lists").rows

@count=0
@degree1.each do |d|
@count=@count+d[0]
end

end
# def ppp
# sql= "CREATE OR REPLACE VIEW records AS SELECT colleges.* FROM colleges WHERE name LIKE '%#{@query.titlecase}%' OR name LIKE '%#{@query.downcase}%' OR name LIKE '%#{@query.upcase}%' OR location LIKE '%#{@query.titlecase}%' OR location LIKE '%#{@query.downcase}%' OR location LIKE '%#{@query.upcase}%'  OR facts LIKE '%#{@query.titlecase}%' OR facts LIKE '%#{@query.upcase}%' OR facts LIKE '%#{@query.downcase}%' OR facts_table LIKE '%#{@query.titlecase}%' OR facts_table LIKE '%#{@query.upcase}%' OR facts_table LIKE '%#{@query.downcase}%'"
#  ActiveRecord::Base.connection.execute(sql)
# @records= ActiveRecord::Base.connection.exec_query("Select * from records")
# @cname= @records.paginate(page: params[:page], per_page: 30)
#   end


def booking
@sub= User.find(session[:user_id]).subscription
if(@sub)
@subtype=User.find(session[:user_id]).subtype
@slots=User.find(session[:user_id]).slotsleft
k=Time.now.strftime("%Y-%m-%d %H:%M:%S %Z")
k=k[0..k.length-4]
time=k
time=time+"UTC"
@dates=Adminslot.where("DATE(slot)>=?",time).order("DATE(slot)").group("DATE(slot)").count
@adminslot= Adminslot.where('slot>=?',time)
else
  @c1=Defaultparam.find(1)
    @c2=Defaultparam.find(2)
    @c3=Defaultparam.find(3) 
end
end
def bookconfirmation
  type=params[:plan]
  @c=Defaultparam.find(type)
end

def slotbooked
if(Adminslot.find(params[:id]) && session[:user_id] && User.find(session[:user_id]) && User.find(session[:user_id]).slotsleft>0)
Adminslot.find(params[:id]).update(booked: true,user_id: session[:user_id])
if(User.find(session[:user_id]).slotsleft==1)
User.find(session[:user_id]).update(subscription: false, subtype: nil, slotsleft: nil)
else
  User.find(session[:user_id]).update(slotsleft: User.find(session[:user_id]).slotsleft-1)
 end
 @slot={
  slot_id: params[:id],
  user_id: session[:user_id]
 }
  UserMailer.with(slot: @slot).bookconfirmation_email.deliver_later
 redirect_to successbooked_path(params[:id])
else
  redirect_to error_path
end
end
def slotsuccess
if(Adminslot.find(params[:id]) && Adminslot.find(params[:id]).user_id==session[:user_id])
@slotinfo=Adminslot.find(params[:id])
else
  redirect_to error_path
end

end
def error
  end

  def authorize_user
    if(!session[:user_id])
      redirect_to root_path(type: "invaliduser")
    end
  end
end
