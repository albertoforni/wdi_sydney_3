class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  #before_action :set_artist, only: [:index, :new, :create] # all collection actions
  #before_action :set_album, only: [:index, :new, :create]

  # GET /songs
  # GET /songs.json
  def index

  	if params[:album_id].nil? && params[:artist_id].nil?
  		@songs = Song.all
    else
    	if params[:artist_id]
    		@songs = Song.where("artist_id=#{params[:artist_id]}")
    	elsif params[:album_id]
    		@songs = Song.where("album_id=#{params[:album_id]}")
    	end

    	if @songs.size <= 0
  			flash.now[:notice] = "No songs exist yet for this album!"
    	end
    end

  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    #@song = Song.new
    @song = @artist.songs.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    #@song = Song.new(song_params)
    @song = @artist.songs.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
      @artist = @song.artist
    end

    def set_artist
      #@artist = Artist.find(params[:artist_id])
      @artist = @song.album
    end

    def set_album
      @album = Album.find(params[:album_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :description, :length, :integer)
    end
end
