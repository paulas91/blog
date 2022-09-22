class AddNotNullConstraintToBasketProductBasket < ActiveRecord::Migration[7.0]
  def change
    change_column_null :basket_products, :basket_id, true
  end
end
