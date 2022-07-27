class MeasurementValue < ApplicationRecord
  belongs_to :measurement
  paginates_per 100
end
