class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_current_user_blog, only: %i[edit update destroy]

  def index
    @blogs = if user_signed_in?
               Blog.where(user_id: [current_user.id, *current_user.followings.ids]).page(params[:page])
             else
               Blog.page(params[:page])
             end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'miniブログを作成しました'
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'mini_blogを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy!
    redirect_to blogs_path, notice: 'mini_blogを削除しました'
  end

  private
  
  def blog_params
    params.require(:blog).permit(%i[content image])
  end

  def set_current_user_blog
    @blog = current_user.blogs.find(params[:id])
  end
end
