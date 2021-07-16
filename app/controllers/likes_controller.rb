class LikesController < ApplicationController
  def create
    like = current_user.likes.build(blog_id: params[:like][:blog_id])
    if like.save
      redirect_to blogs_path
    else
      @blogs = Blog.where(user_id: [current_user, *current_user.followings.ids]).page(params[:page])
      render 'blogs/index'
    end

  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy!
    redirect_to blogs_path
  end
end
