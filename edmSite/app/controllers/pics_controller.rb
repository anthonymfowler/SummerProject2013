class PicsController < ApplicationController
	def festivalPhotos
		@newPhoto = Photo.new
		@allPhotos = Photo.find(:all)
		@festivals = Festival.find(:all)
	end

	def home
		@festivals = Festival.find(:all)
	end

	def upload
		if params[:photo] != nil then
			uploaded_io = params[:photo][:newPhoto]
	    	photo = Photo.new
	    	photo.writePhotoData(uploaded_io)
	    	photo.user_id = session[:user]
	    	photo.file_name = uploaded_io.original_filename
	    	photo.date_time = params[:photo][:date_time]
	    	photo.festival_id = params[:photo][:festival_id]
	    	if photo.valid? then
	    		photo.save
	    		redirect_to("/pics/home/#{session[:user]}")
	    	else
	    		redirect_to("/pics/shithole")
	  		end
	  	else
	  		flash[:error] = "No photo selected :(" 
	  		redirect_to("/pics/shit/#{session[:user]}")
	  	end

	end



	def festival

	end

end
