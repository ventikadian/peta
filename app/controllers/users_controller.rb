class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user)
			.permit(:email, :password, :password_confirmation))

		respond_to do |format|
		if @user.save
			#@user.update(auth_token: "kkkk")
			session[:user_id] = @user.id
			format.html {redirect_to new_user_path, notice: "Succesfully"}
			format.json {render json: @user}
			#redirect_to new_user_path
		else
			format.html {render :new}
			format.json {render json:@user.errors}
			#render :new
		end
		end
	end
end
