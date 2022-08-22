class ArticlesController < ApplicationController
  skip_before_action :authenticate_devise_user!, :only => [:index, :show]
  before_action :find_article, :except => [:index, :create, :new]
  before_action :check_author, :only => [:edit, :update, :destroy, :change_status]

  def index
    # TODO:
    # @article = ArticleFilter.new(params).perform
    # ##############
    @datetime = params.dig(:filter, :created_at)
      # @users = if params[:filter] && params[:filt @article = Article.new(article_params)er][:year] 
    @articles = if @datetime
      Article.where("created_at >= '#{@datetime}'")
        # User.where("birthday >= '#{params[:filter][:year]}-01-01'")
    else
      Article.all
    end

    @status = params.dig(:filter, :status)
    @articles = if @status
      if @status == "archived"
        @articles.status_archived
      elsif @status == "private"
        if current_devise_user
          @articles.status_private.for_user(current_devise_user)#where(user_id: current_devise_user.id)
        else
          flash[:notice] = "No acces to private article"
          redirect_to articles_path
        end 
      else
        @articles.status_public
      end
    else
      @articles.status_public
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  def show
    @comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_devise_user
    if @article.save
      flash[:notice] = "New article has been created"
      redirect_to article_path(@article)
    else 
      flash[:alert] = @article.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to article_path, status: :see_other
  end

  def change_status
    if @article.update(status: params[:status])
      flash[:notice] = "Status changed to #{params[:status]}"
      redirect_to @article
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  
  private

  def full_messages
    ["It is not possible"]
  end

    

  def check_author
    unless @article.user == current_devise_user
      redirect_back(fallback_location: article_path)
    end
  end
  
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
