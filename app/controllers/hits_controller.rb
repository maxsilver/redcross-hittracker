class HitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :grab_required_options

  def index
    if params[:commit]
      @search = Hit.search(params[:hit])
      @hits = @search.all
    else
      @hits = Hit.all
    end
  end

  def new
    @hit = Hit.new()
  end

  def edit
    @hit = Hit.find(params[:id])
  end

  def update
    @hit = Hit.find(params[:id])
    if @hit.update_attributes(params[:hit])
      redirect_to hits_path, :notice => "Updated successully!"
    else
      render action: "edit"
    end
  end

  def create
    @hit = current_user.hits.build(params[:hit])
    if @hit.save
      User.subscribed.each { |u| SubscriptionMailer.new_hit(@hit, current_user).deliver }
      redirect_to hits_path
    else
      render :new
    end
  end
  
  def destroy
    @hit = Hit.find(params[:id])
    @hit.destroy
    redirect_to hits_path
  end

private
  def grab_required_options
    @reporters = Reporter.all
    @chapters = Chapter.all
    @press_releases = PressRelease.all
    @media_outlets = MediaOutlet.all
  end
end
