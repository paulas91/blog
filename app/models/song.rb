class Song < ApplicationRecord
  validates :title, :body, presence: true 
  belongs_to :album
  has_one :artist, through: :album
end
