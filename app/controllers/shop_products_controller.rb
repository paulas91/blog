class ShopProductsController < ApplicationController
  def update
    @shop = Shop.find(params[:shop_id])
    @shop_product = @shop.shop_products.find(params[:id])
      if @shop_product.update(shop_product_params)
        flash[:notice] = "Shop_product updated"
        redirect_to shop_path(@shop)
      else 
        flash[:alert] = @shop_product.errors.full_messages
        render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @shop_product = @shop.shop_products.find(params[:id])
  end

  private

  def shop_product_params
    params.require(:shop_product).permit(:price, :inventory_state)
  end


end
