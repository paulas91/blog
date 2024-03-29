class ArtistsController < ApplicationController
  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true)
    # @artists = Artist.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end

  def show
    @artist = Artist.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artist }
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path, status: :see_other
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :body, :music_style, :cover, :email)
  end
end
