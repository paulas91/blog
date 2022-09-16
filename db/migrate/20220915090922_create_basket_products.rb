class CreateBasketProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_products do |t|
      t.integer :number_products

      t.timestamps
    end
  end
end
