class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:comment][:blog_id])
    comment = current_user.comments.build(params.require(:comment).permit(:blog_id, :content))
    if comment.save
      ContactMailer.comment_mail(@blog).deliver
      redirect_to blog_path(@blog), notice: 'コメントしました'
    else
      @comments = @blog.comments
      render 'blogs/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to blog_path(comment.blog), notice: 'コメントを削除しました'
  end
end
