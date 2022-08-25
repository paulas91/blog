class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end 
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product }
    end 
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Shop.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
