class Song < ApplicationRecord
  validates :title, :body, :author, presence: true 
end
