class AddUniqueIndexToMeasurements < ActiveRecord::Migration[7.0]
  def change
    add_index :measurements, [:name, :upload_id], unique: true
  end
end
