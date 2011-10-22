class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = User.new
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "Updated successully!"
    else
      render action: "edit"
    end
  end
  
  def edit
    @user = User.find(params[:id])
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
