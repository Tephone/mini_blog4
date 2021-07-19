class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:comment][:blog_id])
    comment = current_user.comments.build(comment_params)
    if comment.save
      ContactMailer.comment_mail(@blog).deliver
      redirect_to blog_path(@blog)
    else
      render 'blogs/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if current_user == comment.user
      comment.destroy
      redirect_to blog_path(comment.blog)
    else
      @blog = comment.blog
      render 'blogs/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit %i[blog_id content]
  end
end
