class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])
    if @user.save
        flash.now[:success]= 'Welcome to Whiteboard'
        redirect_to signin_path
    else
        flash.now[:error] = "Email/ Screenname is taken"
        render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

end
