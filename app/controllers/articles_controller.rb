class ArticlesController < ApplicationController
  def index
    # TODO:
    # @article = ArticleFilter.new(params).perform
    # ##############
    @datetime = params.dig(:filter, :created_at)
      # @users = if params[:filter] && params[:filter][:year] 
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
        @articles.status_private
      else
        @articles.status_public
      end
    else
      @articles.status_public
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to article_path, status: :see_other
  end

  def change_status
    @article = Article.find(params[:id])
    if @article.update(status: params[:status])
      redirect_to @article
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
