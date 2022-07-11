class ShopsController < ApplicationController
  def index
    @number = params.dig(:filter, :workers_number)&.to_i
    # @ushops = if params[:filter] && params[:filter][:workers_number] 
    @shops = if @number
      Shop.where("workers_number >= #{@number}")
      # User.where("workers_number >= )
    else
        Shop.all
      end
  end
    
  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to @shop
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Shop.find(params[:id])
    @article.destroy

    redirect_to shop_path, status: :see_other
  end



  private

  def shop_params
    params.require(:shop).permit(:name, :domain, :description, :adress, :phone, :workers_number )
  end

end