class PaintingsController < ApplicationController

	def index
		@paintings = Painting.all
	end

	def show
		@paintings = Painting.all
		@painting = Painting.find(params[:id])
	end

	def new
		@painting = Painting.new
	end

	def create
		painting = Painting.create(painting_params)
		redirect_to painting
	end

	def	edit
		@painting = Painting.find(params[:id])
	end 
	
	def update
		painting = Painting.find(params[:id])
		painting.update_attributes(painting_params)
		redirect_to painting
	end

	def destroy
		painting = Painting.find(params[:id])
		painting.destroy
		redirect_to paintings_path
	end


	def painting_params
		params.require(:painting).permit(:title,:year,:medium,:style,:image, :artist_d) # which fields to update as shown on the form
	end # i.e. here exclude 'password' parameter so people can't create it in 'def create' section

end
