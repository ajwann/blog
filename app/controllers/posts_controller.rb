class PostsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :destroy]

  def index
    @posts = Post.order(created_at: :desc).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def feed
    @posts = Post.order(created_at: :desc).all
    respond_to do |format|
      format.atom { render :layout => false  }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
