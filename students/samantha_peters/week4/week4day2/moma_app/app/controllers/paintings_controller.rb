class PaintingsController < ApplicationController


	def index
		@paintings = Painting.all
	end

	def show
		@painting = Painting.find(params[:id])
	end

	def new
		@painting = Painting.new
	end

	def create
		painting = Painting.create(painting_params)
		redirect_to painting
	end	

	def edit
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
		params.require(:painting).permit(:title,:year,:medium,:style,:image, :artist_id)
	end



end
