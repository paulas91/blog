class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs
  has_many :activities,  as: :activitable
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize: "100x100"
    attachable.variant :medium, resize: "300x300"
  end
    # attachment.variant :thumb, resize_to_limit: [100, 100]
  # end
  alias_attribute :author, :band
end



