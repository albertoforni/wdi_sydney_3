class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :title, except: [:create, :update, :destroy]
  
    def title
      @title = 'Artists'
    end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @albums = @artist.albums
    @album = @artist.albums
    @songs = @artist.songs
  end

  def new
    @artist = Artist.new
  end

  def edit
  
  end

  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end

  private
    def set_artist
      @artist = Artist.find_by_id(params[:id])
      unless @artist
        flash[:alert] = "There is no Artist by that id"
        redirect_to action: 'index'
      end
    end

    def artist_params
      params.require(:artist).permit(:name, :description, :image)
    end

  end
  

