class ProfilesController < ApplicationController

  def show
    @user = User.find_by(user_name: params[:user_name])
    # @posts = @user.posts.order('created_at DESC')
    @posts = User.find_by(user_name: params[:user_name]).posts.order('created_at DESC')
    # @posts = User.find_by(user_name: "AnimeLover").posts.order('created_at DESC')
  end

  def edit
  end
end
