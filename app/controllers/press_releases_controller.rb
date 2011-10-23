class PressReleasesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin!, :only => [:destroy]

  respond_to :json, :html

  def index
    if params[:q]
      respond_with(@press_releases = PressRelease.where("title like '%#{params[:q]}%'"))
    else
      respond_with(@press_releases = PressRelease.all)
    end
  end

  def new
    @press_release = current_user.press_releases.build
  end

  def create
    @press_release = PressRelease.new(params[:press_release])
    if @press_release.save
      redirect_to press_releases_path, :notice => "Created successully!"
    else
      render action: "new"
    end
  end

  def edit
    @press_release = PressRelease.find(params[:id])
  end

  def update
    @press_release = PressRelease.find(params[:id])
    if @press_release.update_attributes(params[:press_release])
      redirect_to press_releases_path, :notice => "Updated successully!"
    else
      render action: "edit"
    end
  end

  def show
    @press_release = PressRelease.find(params[:id])
  end

  def destroy
    @press_release = PressRelease.find(params[:id])
    @press_release.destroy
    redirect_to press_releases_path
  end
end
