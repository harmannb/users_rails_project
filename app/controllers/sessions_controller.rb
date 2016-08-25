class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:Email])
    if @user && @user.authenticate(params[:Password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ["Invalid"]
      redirect_to "/users/new"
    end
  end

  def destroy
    # @user = User.find(session[:user_id])
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end


end
