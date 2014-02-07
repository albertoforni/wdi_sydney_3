class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_album
  before_action :set_artist
  before_action :title, except: [:create, :update, :destroy]
  before_action :retrieve_genres, only: [:new, :edit]

  helper_method :sort_column, :sort_direction

  # GET /songs
  # GET /songs.json
  def index
    @songs =
      if @artist
        @artist.songs.order(sort_column + " " + sort_direction)
      elsif @album
        @album.songs.order(sort_column + " " + sort_direction)
      else
        Song.order(sort_column + " " + sort_direction)
      end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @genres = @song.genres
  end

  # GET /songs/new
  def new
    @song = Song.new
    @path = [@artist, @song]
  end

  # GET /songs/1/edit
  def edit
    @path = @song
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
      @song = Song.find_by_id(params[:id])
      unless @song
        flash[:alert] = 'Song not present'
        redirect_to action: 'index' 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :length, :description, :artist_id, :album_id, :video, genre_ids: [])
    end

    def title
      @title = 'Songs'
    end

    def sort_column
      Song.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
    end

    def set_album
      @album = 
        if params[:album_id].present?
          Album.find_by_id(params[:album_id])
        elsif @song
          @song.album
        end
    end

    def set_artist
      @artist =
        if params[:artist_id].present?
          Artist.find_by_id(params[:artist_id])
        elsif @album
          @album.artist
        elsif @song
          @song.artist
        end
    end

    def retrieve_genres
      @genres = Genre.all
    end
end
