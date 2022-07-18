class ChangeColumnForMeasurementValues < ActiveRecord::Migration[7.0]
  def change
    change_column(:measurement_values, :measurement_time, :time)
  end
end
