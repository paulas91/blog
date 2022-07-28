class ShopsController < ApplicationController
  def index
    @order_by = params.dig(:filter, :order_by) || :name
    @sort_direction = params.dig(:filter, :sort_direction) || "asc"
    @shops = Shop.order(@order_by => @sort_direction)
    @number = params.dig(:filter, :workers_number)&.to_i
    # @shops = if params[:filter] && params[:filter][:workers_number] 
    @shops = @shops.workers_number(@number) if @number
      # User.where("workers_number >=
    @query = params.dig(:search, :query)
    @shops = @shops.search(@query) if @query.present?
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
      redirect_to shops_path
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