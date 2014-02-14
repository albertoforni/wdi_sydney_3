class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_artist
  before_action :set_album

  # GET /songs
  # GET /songs.json
  def index
    if @artist
      @songs = @artist.songs.all
    elsif @album
      @songs = @album.songs.all
    else
      @songs = Song.all
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

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
      @song = Song.find_by :id => params[:id]

        if @song.blank?
          redirect_to songs_path, alert: "song not found."
        # else
        #   @album = @song.album
        end
    end

    def set_artist
      if params[:artist_id].present?
        @artist = Artist.find(params[:artist_id])
      else
         @artist = @song.artist if @song.present?
      end
    end

    def set_album
      if params[:album_id].present?
        @album = Album.find(params[:album_id])
      else
         @album = @song.album if @song.present?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :length, :description, :artist_id, :album_id, :youtube)
    end
end
