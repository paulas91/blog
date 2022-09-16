class RemoveNumberProductsFromBasket < ActiveRecord::Migration[7.0]
  def change
    remove_column :baskets, :number_products
  end
end
