class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_screenname(params[:session][:screenname].downcase)
    if @user
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error]= "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    redirect_to root_url
  end
end
