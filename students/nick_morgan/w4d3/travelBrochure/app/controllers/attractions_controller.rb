class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :set_destination 
  # GET /attractions
  # GET /attractions.json
  def index
    @attractions = @destination.attractions
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
  end

  # GET /attractions/new
  def new
    @attraction = @destination.attractions.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = @destination.attractions.new(attraction_params)

    respond_to do |format|
      if @attraction.save
        format.html { redirect_to destination_attraction_path(@destination, @attraction), notice: 'Attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def set_destination
      @destination = Destination.find_by_id(params[:destination_id])
      
      if @destination.blank?
        @destination = @attraction.destination if @attraction
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:name, :image, :destination_id)
    end
end
