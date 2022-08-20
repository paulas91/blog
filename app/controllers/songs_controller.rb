class SongsController < ApplicationController
  # protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :json_request?

  def json_request?
    request.format.json?
  end

  def index
    @songs = Song.all.includes(album: {cover_attachment: :blob}) #{cover: { costam: :costamjeszcze })
    flash.now[:notice] = "We have exactly #{@songs.size} songs available."
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end 

  def show
    @song = Song.find(params[:id])
    @album = @song.album    
    respond_to do |format|
      format.html  
      format.json { render json: @song }
    end

  end

  def new
    @song = Song.new
  end

  def create 
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_path, status: :see_other
  end

  private

  def song_params
    params.require(:song).permit(:title, :body, :album_id)
  end
end
