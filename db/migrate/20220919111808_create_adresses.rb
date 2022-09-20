class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :city
      t.string :home_number
      t.string :zip_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
