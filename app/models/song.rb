class Song < ApplicationRecord
  validates :title, :body, presence: true 
  belongs_to :album
  has_many :activities, as: :activitable
  has_one :artist, through: :album
  
end
