class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.references :upload, null: false, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
