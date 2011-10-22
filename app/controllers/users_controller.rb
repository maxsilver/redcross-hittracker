class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_user, :only => [:edit, :update, :destroy]
  before_filter :new_user, :only => [:new, :index]
  before_filter :all_users, :only => [:new, :index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "Updated successully!"
    else
      render action: "edit", :error => "Could not update the user."
    end
  end

  def edit
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
    @user.destroy
    redirect_to users_path
  end

  def find_user
    @user = User.find(params[:id])
  end

  def new_user
    @user = User.new
  end

  def all_users
    @users = User.all
  end
end
