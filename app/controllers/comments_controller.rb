class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(article), notice: 'コメントを追加できたよ'
    else
      flash.now[:error] = 'コメントを追加できませんでした'
      # NOTE: Rails 7ではstatus: :unprocessable_entityを入れる必要がある
      render :new, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
