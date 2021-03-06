class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_post, only: [:edit, :update, :destroy]


  def index
    @posts = Post.all.order('created_at DESC').page params[:page]
  end

  def new
    @post = current_user.posts.build
  end

  def show
  end

  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end

  end

  def create

    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post have been created!"
      redirect_to profile_path(current_user.user_name)
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
      redirect_to(profile_path(current_user.user_name))
    else
      flash[:alert] = "Your new post couldn't be updated! Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:image, :caption, :user_name)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post

    unless current_user == @post.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end

  end

end