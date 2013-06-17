class UsersController < ApplicationController
	def login
	end

	def post_login
	  @user = User.find_by_login(params[:text_val])
	  if @user && @user.password_valid?(params[:password]) then
	  	reset_session
	  	session[:user] = @user.id
	    redirect_to("/users/login")
	  else
	  	flash[:error] = "Invalid username password combo"
	    redirect_to(:action => :login)
	  end
	end

	def logout
		reset_session
		redirect_to(:action => :login)
	end

	def new
		@user = User.new
	end


	def create
		@user = User.new(params[:user])
		if @user.valid? then
			@user.save
			redirect_to("/users/login")
		else
			flash[:error] = @user.errors
			redirect_to("/users/new")
		end
	end

end
