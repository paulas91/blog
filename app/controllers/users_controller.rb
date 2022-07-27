class UsersController < ApplicationController 
  def index
    @order_by = params.dig(:filter, :order_by) || :first_name
    @sort_direction = params.dig(:filter, :sort_direction) || "asc"
    @users = User.order(@order_by => @sort_direction)
    # @users = User.order(params[:])
    @year = params.dig(:filter, :year)&.to_i
    # @users = if params[:filter] && params[:filter][:year] 
    if @year
      @users = @users.where("birthday >= '#{@year}-01-01'")
      # User.where("birthday >= '#{params[:filter][:year]}-01-01'")
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :email, :phone)
  end

end


 
