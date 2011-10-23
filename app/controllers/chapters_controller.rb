class ChaptersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin!, :only => [:destroy]
  
  respond_to :json, :html
  
  def index
    if params[:q]
      respond_with(@chapters = Chapter.where("name like '%#{params[:q]}%'"))
    else
      respond_with(@chapters = Chapter.all)
    end
  end
  
  def new
    @chapter = Chapter.new(:region_id => Region.first.id)
  end
  
  def create
    @chapter = Chapter.new(params[:chapter])
    if @chapter.save
      redirect_to locations_path, :notice => "Created successully!"
    else
      render action: "new"
    end
  end
  
  def edit
    @chapter = Chapter.find(params[:id])
  end
  
  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(params[:chapter])
      redirect_to locations_path, :notice => "Updated successully!"
    else
      render action: "edit"
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to locations_path
  end
end
