class ImageController < ApplicationController
 def show
 	if (File.file?('/allimages/'+params[:name]))
    send_file ('/allimages/'+params[:name].gsub('.',' ')), :disposition => 'inline'
else
	k=params[:name].split('-')
	puts k
	if(k.last=="icon")
	send_file File.join('/allimages/default-icon'), :disposition => 'inline'
else
	send_file File.join('/allimages/default-cover'), :disposition => 'inline'
end
end
 end
end
