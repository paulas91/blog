class UsersController < ApplicationController 
  def index
    @year = params.dig(:filter, :year)&.to_i
    # @users = if params[:filter] && params[:filter][:year] 
    @users = if @year
      User.where("birthday >= '#{@year}-01-01'")
      # User.where("birthday >= '#{params[:filter][:year]}-01-01'")
    else
      User.all
    end
  end

  def show
    @user = User.find(params[:id])
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
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, status: :see_other
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :email, :phone)
  end

end


 
