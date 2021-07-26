class LikesController < ApplicationController
  def create
    like = current_user.likes.build(blog_id: params[:like][:blog_id])
    like.save
    redirect_to blogs_path, notice: 'いいねしました'
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy!
    redirect_to blogs_path, notice: 'いいねをやめました'
  end
end
