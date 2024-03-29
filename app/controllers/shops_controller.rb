class ShopsController < ApplicationController
  include ActivityConcern
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
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shops }
    end
  end

  def show
    @categories = Category.all
    @shop = Shop.find(params[:id])
    @basket = @shop.baskets.where(user_id: current_devise_user.id, state: Basket.states[:init]).first
    if @basket
      @basket_products = @basket.basket_products
    end
    @shop_products = @shop.shop_products
    if params[:category_id]
      @category = @categories.find(params[:category_id])
      @shop_products = @shop_products.joins(:product).where("products.category_id = ?", @category.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop }
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = "Shop succesfully created"
      redirect_to shops_path
    else
      flash[:alert] = @shop.errors.full_messages
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
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shop_path, status: :see_other
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :domain, :description, :adress, :phone, :workers_number, product_ids: [])
  end
end
