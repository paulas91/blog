class AdressesController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @basket = @shop.baskets.find(params[:basket_id])
    @adress = Adress.new(adress_params)
    @adress.user = current_devise_user
    if @adress.save
      @basket_adress = @basket.basket_adresses.new(adress_id: @adress.id )
      if @basket_adress.save
        @basket.provide_adress!
        flash[:notice] = "New adress has been created"
        redirect_to shop_basket_path(@shop, @basket)
      else
        flash[:alert] = @basket_adress.errors.full_messages.join(", ")
        render "baskets/show", status: :unprocessable_entity
      end
    else
      flash[:alert] = @adress.errors.full_messages.join(", ")
      render "baskets/show", status: :unprocessable_entity
    end
  end

  private

  def adress_params
    params.require(:adress).permit(:street, :city, :home_number, :zip_code)
  end
end
