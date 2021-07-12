class CommentsController < ApplicationController
  def create
    blog = Blog.find(params[:comment][:blog_id])
    comment = current_user.comments.build(params.require(:comment).permit(:content, :blog_id))
    if comment.save
      redirect_to blog_path(blog), notice: 'コメントを作成しました'
    else
      @comments = blog.comments
      render 'blogs/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to blog_path(comment.blog), notice: 'コメントを削除しました'
  end
end
