class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.commenter = current_user.full_name
    @comment.status = @article.status
    if @comment.save
      redirect_to article_path(@article)
    else
      render 'articles/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status)
  end
end