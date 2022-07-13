class Song < ApplicationRecord
  validates :title, :body, presence: true 
  belongs_to :album
end
