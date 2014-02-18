class SensesController < ApplicationController
  http_basic_authenticate_with name: "username", password: "password"#, except: :index
  before_action :set_sense, only: [:show, :edit, :update, :destroy]

  # GET /senses
  # GET /senses.json
  def index
    #@senses = Sense.all

	# @robot = Robot.find_by_id(params[:robot_id]) # gathering the id after artist in the browser. if was after album would just use id
 #  	if !@robot
 #  		raise "no robot found!"
 #  	else
 #  		if @robot.senses.empty?
	#     	@senses = @robot.senses
	#     	flash.now[:notice] = "No senses exist yet for this robot!"
	#     else
	#     	@senses = @robot.senses
	#     end
 #  	end

	# senses GET    /senses(.:format)
   	if params[:id].nil? && params[:robot_id].nil?
  		@senses = Sense.all
    else
    	if params[:robot_id]
    		@senses = Sense.where("robot_id=#{params[:robot_id]}")
    	else
    		raise "check your routes!"
    	end

    	if @senses.size <= 0
  			flash.now[:notice] = "No senses exist yet for this album!"
    	end
    end

  end

  # GET /senses/1
  # GET /senses/1.json
  def show
  end

  # GET /senses/new
  def new
  	#@robot = Robot.find_by_id(params[:robot_id]) 
  	#@sense = @robot.senses
  	#@robot = Robot.find_by_id(params[:robot_id])
    #@sense = Sense.new(params[:robot_id])
    #@sense = Sense.new(params[:robot_id]) 

    if params[:id].nil? && params[:robot_id].nil?
    	#
	else
    	if params[:robot_id]
    		@sense = Sense.where("robot_id=#{params[:robot_id]}")
    		@sense = @sense.new

			@sense.robot_id = params[:robot_id]

    	else
    		raise "check your routes!!"
    	end
    end

  end

  # GET /senses/1/edit
  def edit
  end

  # POST /senses
  # POST /senses.json
  def create
    @sense = Sense.new(sense_params)

    respond_to do |format|
      if @sense.save
        format.html { redirect_to @sense, notice: 'Sense was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sense }
      else
        format.html { render action: 'new' }
        format.json { render json: @sense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /senses/1
  # PATCH/PUT /senses/1.json
  def update
    respond_to do |format|
      if @sense.update(sense_params)
        format.html { redirect_to @sense, notice: 'Sense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /senses/1
  # DELETE /senses/1.json
  def destroy
    @sense.destroy
    respond_to do |format|
      format.html { redirect_to senses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sense
      #@sense = Sense.find(params[:id])

      @sense = Sense.find(params[:id])
      @robot = @sense.robot

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sense_params
      params.require(:sense).permit(:name, :description, :image, :robotimages, :robot_id)
    end
end
