class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end 
  end

  def show
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product }
    end 
  end

  def new
    @category = Category.find(params[:category_id])
    @product = @category.products.new
  end

  def create 
    @category = Category.find(params[:category_id])
    @product = @category.products.new(product_params)
    if @product.save
      redirect_to category_products_path(@category)
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def update 
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    if @product.update(product_params)
      redirect_to category_products_path(@category)
    else
      flash[:alert] = @product.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to category_products_path(@category), status: :see_other
  end

  def bulk_update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    @product.shop_products.where(id: params[:shop_product][:shop_products_ids]).update(price: params[:shop_product][:price])
    redirect_to category_product_path(@category, @product)

  end

  private

  def product_params
    params.require(:product).permit(:name, :image)
  end
end
