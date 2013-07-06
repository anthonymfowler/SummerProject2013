class FestivalsController < ApplicationController

	def home
		@festivals = Festival.find(:all)
		@newFestival = Festival.new
	end


	def createFestival
		@newFestival = Festival.new
		@newFestival.festival_name = params[:festival][:festival_name]
		@newFestival.start_date = params[:festival][:start_date]
		@newFestival.duration = params[:festival][:duration]
		@newFestival.location = params[:festival][:location]
		if @newFestival.valid? then
			@newFestival.save
			if params[:festival][:newPhoto] != nil then
				uploaded_io = params[:festival][:newPhoto]
	    		photo = Photo.new
	    		photo.writePhotoData(uploaded_io)
	    		photo.file_name = uploaded_io.original_filename
	    		photo.date_time = DateTime.now
	    		photo.save
	    		@newFestival.photo = photo
				redirect_to("/homepage/home")
			else
				flash[:error] = @newFestival.errors
				redirect_to("/users/home")
			end
		end
	end
	
end
