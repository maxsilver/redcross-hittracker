class MediaOutletsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin!, :only => [:destroy]

  respond_to :json, :html

  def index
    if params[:q]
      respond_with(@media_outlets = MediaOutlet.where("name like '%#{params[:q]}%'"))
    else
      respond_with(@media_outlets = MediaOutlet.all)
    end
  end

  def new
    @media_outlet = current_user.media_outlets.build
  end

  def create
    @media_outlet = MediaOutlet.new(params[:media_outlet])
    if @media_outlet.save
      redirect_to media_path, :notice => "Created successully!"
    else
      render action: "new"
    end
  end

  def edit
    @media_outlet = MediaOutlet.find(params[:id])
  end

  def update
    @media_outlet = MediaOutlet.find(params[:id])
    if @media_outlet.update_attributes(params[:media_outlet])
      redirect_to media_path, :notice => "Updated successully!"
    else
      render action: "edit"
    end
  end

  def show
    @media_outlet = MediaOutlet.find(params[:id])
  end

  def destroy
    @media_outlet = MediaOutlet.find(params[:id])
    @media_outlet.destroy
    redirect_to media_path
  end
end
