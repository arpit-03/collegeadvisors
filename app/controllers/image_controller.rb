class ImageController < ApplicationController
 def show
 	if (File.file?('/home/arpit/Desktop/scrapedu/artscolgdata/'+params[:name]))
    send_file ('/home/arpit/Desktop/scrapedu/artscolgdata/'+params[:name].gsub('.',' ')), :disposition => 'inline'
else
	k=params[:name].split('-')
	puts k
	if(k.last=="icon")
	send_file File.join('/home/arpit/Desktop/scrapedu/artscolgdata/default-icon'), :disposition => 'inline'
else
	send_file File.join('/home/arpit/Desktop/scrapedu/artscolgdata/default-cover'), :disposition => 'inline'
end
end
 end
end
