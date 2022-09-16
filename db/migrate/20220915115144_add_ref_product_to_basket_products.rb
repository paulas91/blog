class AddRefProductToBasketProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :basket_products, :product, null: false, foreign_key: true
  end
end
