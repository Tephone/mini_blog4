class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if user_signed_in?
      follow_blogs_include_mine = Blog.where(user_id: [current_user.id, *current_user.followings.ids])
      @blogs = follow_blogs_include_mine.page(params[:page])
    else
      @blogs = Blog.page(params[:page])
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(params.require(:blog).permit(:content, :image, :image_cache))
    if @blog.save
      redirect_to blogs_path, notice: 'miniブログを作成しました'
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments
  end
end
