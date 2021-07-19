class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:comment][:blog_id])
    comment = current_user.comments.build(params.require(:comment).permit %i(blog_id content))
    if comment.save
      redirect_to blog_path(@blog)
    else
      @comments = @blog.comments
      render 'blogs/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to blog_path(comment.blog)
  end
end
