class PlacesController < ApplicationController
	before_action :authorize, except: [:index, :show]
	def new
		@place = Place.new
	end

	def show
		place = Place.find(params[:id])
		render json: post
	end

  	def update
  		#minta objeknya ke model
  		@place = Place.find(params[:id])
  		@place.update(params.require(:place).
  			permit(:name, :longitute, :latitude))
  		redirect_to new_place_path, notice: "Succesfully update the post!"
	end

	def index
		@places = Place.all
		respond_to do |format|
			format.html
			format.json {render json: @places}
			format.xml {render xml: @places}
		end
	end

	def destroy
		place = Place.find(params[:id])
		place.destroy
		redirect_to places_path
	end

	def create
		#render json:params
		@place = Place.new(params.require(:place)
			.permit(:name, :longitute, :latitude))
		respond_to do |format|
			if @place.save
				format.html {redirect_to places_path, notice: "Succesfully save the place"}
				format.json {render json:@place}
			else
				format.html {render :new}
				format.json {render json:@place.errors}
			end
		end
	end

	def edit
		@place = Place.find(params[:id])
  	end
end
