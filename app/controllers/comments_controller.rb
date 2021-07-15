class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(params.require(:comment).permit(:blog_id, :content))
    if comment.save
      redirect_to blog_path(params[:comment][:blog_id]), notice: 'コメントしました'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to blog_path(comment.blog), notice: 'コメントを削除しました'
  end
end
