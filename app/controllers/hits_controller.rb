class HitsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @hits = Hit.all
  end
  
  def new
    @hit = Hit.new()
  end
  
  def edit
    @hit = Hit.find(params[:id])
    @media_outlets = MediaOutlet.all
    @reporters = Reporter.all
    @chapters = Chapter.all
    @press_releases = PressRelease.all
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
      redirect_to hits_path
    else
      render :new
    end
  end
    
end
