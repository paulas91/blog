class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to songs_path
    else
      render :new, status: :unprocessable_entity  
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :band)
  end
end
