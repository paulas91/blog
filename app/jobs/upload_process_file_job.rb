class UploadProcessFileJob < ApplicationJob
  queue_as :default

  def perform(upload_id)
    Upload.find(upload_id).process_file
  end
end
