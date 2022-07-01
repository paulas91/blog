class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :domain
      t.text :description
      t.string :adress
      t.string :phone
      t.integer :workers_number

      t.timestamps
    end
  end
end
