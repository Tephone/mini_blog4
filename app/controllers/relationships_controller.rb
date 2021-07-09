class RelationshipsController < ApplicationController
	def create
		@users = User.page(params[:page]).per(10)
		active_relationship = current_user.active_relationships.new(followed_id: params[:relationship][:followed_id])
		if active_relationship.save
			redirect_to blogs_path, notice: "#{current_user.followings.last.name}さんをフォローしました"
		else
			render 'users/index'
		end
	end

	def destroy
		active_relationship = current_user.active_relationships.find(params[:id])
		active_relationship.destroy!
		redirect_to blogs_path, notice: "#{active_relationship.followed.name}さんのフォローを解除しました"
	end
end
