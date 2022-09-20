class CreateBasketAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_adresses do |t|
      t.references :adress, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
