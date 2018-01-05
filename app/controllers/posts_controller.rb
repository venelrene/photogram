class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create

    if @post = Post.create(post_params)
      flash[:success] = "Your post have been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end

  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Your post have been updated!"
      redirect_to(posts_path(@post))
    else
      flash[:alert] = "Your new post couldn't be updated! Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end