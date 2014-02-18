class HunchesController < ApplicationController
  layout 'user'
  before_action :set_hunch, only: [:show, :edit, :update, :destroy]

  # GET /hunches
  # GET /hunches.json
  def index
    #@hunches = Hunch.all
    #@hunches = Idea.all
    #@hunches = Idea.search(params[:search]
	
	if params[:search].present?
    	@ideas = Idea.where(:id => params[:search])    # search method is in the Idea model!!! (not the Hunch model)
  	else
  		@ideas = Idea.all
    end


  end

  # GET /hunches/1
  # GET /hunches/1.json
  def show
  	#@hunches = Ideas.where('idea_id IN (?)', params[:hunch])
  	#@hunch = Idea.find(params[:id])
  end

  # GET /hunches/new
  def new
    @hunch = Hunch.new
  end

  # GET /hunches/1/edit
  def edit
  end

  # POST /hunches
  # POST /hunches.json
  def create
    @hunch = Hunch.new(hunch_params)

    respond_to do |format|
      if @hunch.save
        format.html { redirect_to @hunch, notice: 'Hunch was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hunch }
      else
        format.html { render action: 'new' }
        format.json { render json: @hunch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hunches/1
  # PATCH/PUT /hunches/1.json
  def update
    respond_to do |format|
      if @hunch.update(hunch_params)
        format.html { redirect_to @hunch, notice: 'Hunch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hunch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hunches/1
  # DELETE /hunches/1.json
  def destroy
    @hunch.destroy
    respond_to do |format|
      format.html { redirect_to hunches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hunch
      @hunch = Hunch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hunch_params
      params.require(:hunch).permit(:name, :description)
    end
end
