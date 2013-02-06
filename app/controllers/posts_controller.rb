class PostsController < ApplicationController
  def index
    @posts = Post.find_by_user_id(params[:user][:id])
    if @posts.nil?
      render 'new'
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])
  end

  def edit
    @post = Post.find(params[:post][:id])
  end

  def update
    @post = Post.find(params[:post][:id])
    @post.update_attributes(params[:post])
  end

  def show
    @post = Post.find_by_title(params[:post][:title])
  end

  def destroy
    @post = Post.find(params[:post][:id])
    @post.destroy
  end


end
