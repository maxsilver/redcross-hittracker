class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = User.new
    @users = User.all
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path
    else
      @users = User.all
      render :index
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
