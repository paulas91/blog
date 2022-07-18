class CreateMeasurementValues < ActiveRecord::Migration[7.0]
  def change
    create_table :measurement_values do |t|
      t.references :measurement, null: false, foreign_key: true
      t.float :value
      t.datetime :measurement_time

      t.timestamps
    end
  end
end
