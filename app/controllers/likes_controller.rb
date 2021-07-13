class LikesController < ApplicationController
	def index
		@likes = Like.where(blog_id: params[:blog_id]).includes(:user).page(params[:page])
		# @likes = Like.all

	end
	def create
		like = current_user.likes.build(blog_id: params[:like][:blog_id])
		if like.save
			redirect_to blogs_path, notice:  "#{like.blog.user.name}さんの投稿にイイネしました"
		else
			@blogs = Blog.where(user_id: [current_user, *current_user.followings.ids]).page(params[:page])
			render 'blogs/index'
		end
	end

	def destroy
		like = current_user.likes.find(params[:id])
		like.destroy!
		redirect_to blogs_path, notice: "イイネを解除しました"
	end
end
