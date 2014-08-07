class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email])
		respond_to do |format|
			if user && user.authenticate(params[:password])
				#loginsuccesfull
			 	format.html do
					session[:user_id] = user.id
					redirect_to places_path, notice: "Logged In!"
				end
				format.json {render json: user}
			else
				format.html do
					flash.now.alert = "Invalid email or password"
					render :new
				end
				format.json {render json: "Invalid email or password"}
			end
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to places_path, notice: "Logged out!"
	end
end
