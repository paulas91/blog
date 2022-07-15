class Artist < ApplicationRecord
  has_one_attached :cover 
  has_many :songs
  validates :name, :body, :music_style, presence: true
  validates :name, uniqueness: true

end
