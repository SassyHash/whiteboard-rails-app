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
    @post = Post.new(params[:post])
    if @post.save!
      flash.now[:success]= 'New post on your whiteboard! Woohoo!'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:post][:id])
  end

  def update
    @post = Post.find(params[:post][:id])
    @post.update_attributes(params[:post])
  end

  def show
    p params
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post][:id])
    @post.destroy
  end


end
