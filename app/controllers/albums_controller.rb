class AlbumsController < ApplicationController
  include ActivityConcern
  def index
    @albums = Album.all.includes(:songs)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end 
  end

  def show
    @album = Album.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @album }
    end 
  end


  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      create_activitable(@album)
      redirect_to songs_path
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :author, :cover, :artist_id)
  end
end
