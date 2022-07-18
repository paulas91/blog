class Measurement < ApplicationRecord
  belongs_to :upload
  has_many :measurement_values
  validates :name, uniqueness: { scope: :upload_id }
end
