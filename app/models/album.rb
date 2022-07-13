class Album < ApplicationRecord
  has_many :songs
  has_one_attached :cover #do |attachment|
    # attachment.variant :thumb, resize_to_limit: [100, 100]
  # end
  alias_attribute :author, :band
end
