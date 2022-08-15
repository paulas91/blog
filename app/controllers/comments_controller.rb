class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_devise_user
    @comment.status = @article.status
    if @comment.save
      redirect_to article_path(@article)
    else
      flash[:alert] = @comment.errors.full_messages
      render 'articles/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status)
  end
end