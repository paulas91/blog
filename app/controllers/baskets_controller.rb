class  BasketsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @basket = @shop.baskets.find_or_create_by(shop_id: params[:shop_id], user_id: current_devise_user.id)
  end
end
