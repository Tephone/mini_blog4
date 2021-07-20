class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:comment][:blog_id])
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to blog_path(@blog), notice: 'コメントしました'
    else
      render 'blogs/show'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    redirect_to blog_path(comment.blog), notice: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(%i[blog_id content])
  end
end
