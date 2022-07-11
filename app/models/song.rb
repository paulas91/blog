class Song < ApplicationRecord
  validates :title, :body, :author, presence: true 
  belongs_to :album
end
