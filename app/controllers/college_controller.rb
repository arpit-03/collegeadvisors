class CollegeController < ApplicationController
  def index

  	a= College.find(params[:id])
  	@name= a.name
  	@location =a.location
  	@facts = a.facts
  	@facts_table = JSON.parse(a.facts_table)
  	@facility = JSON.parse(a.facility)
    
@current_college_id=params[:id]




if(params[:degree] && params[:order])

if(params[:degree]=="all")  
  @cname= Course.where(table_id: params[:id] ).paginate(page: params[:page], per_page: 30).order('name '+ params[:order])
else
  @cname= Course.where(degree: params[:degree],table_id: params[:id] ).paginate(page: params[:page], per_page: 30).order('name ' + params[:order])
end

else
@cname= Course.where(table_id: params[:id] ).paginate(page: params[:page], per_page: 30).order('name ASC')
 end

  @fields= Course.where(table_id: params[:id]).group(:degree).order('count(degree) DESC').count('degree')
  @count=Course.where(table_id: params[:id]).count()
  end

end
