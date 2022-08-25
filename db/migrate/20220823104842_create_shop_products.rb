class CreateShopProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_products do |t|
      t.string :price
      t.string :inventory_state
      t.belongs_to :product, foreign_key: true
      t.belongs_to :shop, foreign_key: true

      t.timestamps
    end
  end
end
