class  BasketsController < ApplicationController
  def show
    @shop = Shop.find(params[:shop_id])
    @shop_product = @shop.shop_products.find(params[:id])
    @basket = @shop.baskets.find(params[:id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @basket = @shop.baskets.find_or_create_by(shop_id: params[:shop_id], user_id: current_devise_user.id, state: Basket.states[:init])
    @basket_product = @basket.basket_products.find_or_initialize_by(product_id: params[:cart][:product_id])
    @basket_product.number_products = params[:cart][:number_products]
    if @basket_product.save
      redirect_to shop_basket_path(@shop, @basket)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @basket = @shop.baskets.find(params[:id])
    if params[:cart][:event] == "confirm"
      @basket.confirm!
    end
    redirect_to shop_basket_path(@shop, @basket)
  end
end
