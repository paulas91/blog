class Measurement < ApplicationRecord
  belongs_to :upload
  has_many :measurement_values, dependent: :destroy
  validates :name, uniqueness: { scope: :upload_id }
end
