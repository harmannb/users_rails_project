class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
    @secret = Secret.all
  end

  def create
    @secret = Secret.create(content: params[:content], user: User.find(session[:user_id]))
    @user = User.find(session[:user_id])
    redirect_to "/users/#{@user.id}"
  end


  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to "/users/#{current_user.id}"
  end

end

