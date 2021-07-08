class BlogsController < ApplicationController
  def index
    @blogs = Blog.page(params[:page]).per(10)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params.require(:blog).permit(:content))
    if @blog.save
      redirect_to blogs_path, notice: 'miniブログを作成しました'
    else
      render :new
    end
  end
end
