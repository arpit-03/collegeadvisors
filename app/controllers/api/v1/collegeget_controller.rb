module Api 
	module V1 
        class CollegegetController< ApplicationController 
            skip_before_action :verify_authenticity_token
            def returncollege
            	degree= params[:degree]
                ind=params[:ind]
                collegeid=params[:collegeid]
                order=params[:order]


            	 if(degree!="" && ind!="" && collegeid!="")
            	 	if(degree=="all")
                    info=Course.where(table_id: collegeid ).paginate(page: ind, per_page: 30).order('name '+order.to_s)
                     puts info
                    else
                    info=Course.where(degree: degree,table_id: collegeid ).paginate(page: ind, per_page: 30)
                    puts info
            	 end
                 render json: {status:"success", records: info}
                 else
            	 	render json: {status: "error", code: 400 , message: "Basic information not available" }
            	 end
            end

            def returndegree
                stream= params[:stream]
                ind=params[:ind]
                order=params[:order]
                if (stream!="" && ind!="")
                    info= College.where(stream.to_s+" = true").paginate(page: ind, per_page: 30)
                    render json: {status:"success", records: info}
                  else
                    render json: {status: "error", code: 400 , message: "Basic information not available" }
                 end
            end
        end
    end
end