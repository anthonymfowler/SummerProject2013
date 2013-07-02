class HomepageController < ApplicationController
	def home
		@festivals = Festival.find(:all)
		@newFestival = Festival.new
	end


	def createFestival
		@newFestival = Festival.new(params[:festival])
		if @newFestival.valid? then
			@newFestival.save
			redirect_to("/homepage/home")
		else
			flash[:error] = @newFestival.errors
			redirect_to("/users/home")
		end
	end
end
