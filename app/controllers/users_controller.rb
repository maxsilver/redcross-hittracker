class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin!, :only => [:new, :create, :edit, :update, :delete]

  def index
    @users = User.all
  end

  def new
    @user = User.new
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "Updated successully!"
    else
      render action: "edit", :error => "Could not update the user."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  def profile
    @user = current_user
    if request.put?
      if @user.update_attributes(params[:user])
        redirect_to users_path, :notice => "Updated successully!"
      else
        render action: "profile", :error => "Could not update your profile."
      end
    end
  end
end
