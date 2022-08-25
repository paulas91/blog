class ChangeTypeOfPriceAndInventoryStateInShopProducts < ActiveRecord::Migration[7.0]
  def change
    change_column(:shop_products, :price, :decimal, precision: 7, scale: 2)
    change_column(:shop_products, :inventory_state, :integer)
  end
end
