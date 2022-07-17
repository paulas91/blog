class Artist < ApplicationRecord
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize: "100x100" 
    attachable.variant :medium, resize: "300x300"
  end 

  has_many :songs
  validates :name, :body, :music_style, presence: true
  validates :name, uniqueness: true


end
