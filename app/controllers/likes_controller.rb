class LikesController < ApplicationController
  def create
    like = current_user.likes.build(blog_id: params[:like][:blog_id])
    if like.save
      redirect_to blogs_path, notice: "#{like.blog.user.name}さんの投稿にいいねしました"
    else
      follow_blogs_include_mine = Blog.where(user_id: [current_user.id, *current_user.followings.ids])
      @blogs = follow_blogs_include_mine.page(params[:page])
      render 'blogs/index'
    end
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy!
    redirect_to blogs_path
  end
end
