class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    # @upload.state = "new"
    if @upload.save
      redirect_to uploads_path
    else
      render :new, status: :unprocessable_entity 
    end

  end

  def show
    @upload = Upload.find(params[:id])
  end

  def process_file
    UploadProcessFileJob.perform_later(params[:id])
    redirect_to uploads_path
  end

  private
  
  def upload_params
    params.require(:upload).permit(:file).merge(state: "new")
  end
end
