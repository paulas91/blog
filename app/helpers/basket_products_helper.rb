module BasketProductsHelper
  def basket_number_of_product(shop_product, basket_products)
    return 0 if basket_products.nil?

    basket_product = basket_products.find { |bp| bp.product_id == shop_product.product_id }
    return 0 if basket_product.nil?

    basket_product.number_products
  end
end
