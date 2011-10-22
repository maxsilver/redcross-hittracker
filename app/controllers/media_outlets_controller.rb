class MediaOutletsController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :json, :html
  
  def index
    if params[:q]
      respond_with(@media_outlets = MediaOutlet.where("name like '%#{params[:q]}%'"))
    end
    
    respond_with(@press_releases = MediaOutlet.all)
  end
  
  def new
    @media_outlet = current_user.media_outlets.build
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
  
  def create
    @media_outlet = MediaOutlet.new(params[:media_outlet])
    
    if @media_outlet.save
      redirect_to media_path, :notice => "Created successully!"
    else
      render action: "new"
    end
  end
end
