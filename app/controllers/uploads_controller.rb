class UploadsController < ApplicationController
  def index
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    # @upload.state = "new"
    if @upload.save
      redirect_to @upload
    else
      render :new, status: :unprocessable_entity 
    end

  end

  def show
  end

  private
  
  def upload_params
    params.require(:upload).permit(:file).merge(state: "new")
  end
end
