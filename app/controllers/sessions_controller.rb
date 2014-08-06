class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password]) #loginsuccesfull
		session[:user_id] = user.id
		redirect_to places_path, notice: "Logged In!"
		else
			flash.now.alert = "Invalid email or password"
			render :new
		end
		#1. get user based on email
		#2. jika user ada authentifikasi dengan password yang di submit
		#3. handle respon
	end
	def destroy
		session[:user_id] = nil
		redirect_to places_path, notice: "Logged out!"
	end
end
