class ChaptersController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :json, :html
  
  def index
    if params[:q]
      respond_with(@chapters = Chapter.where("title like '%#{params[:q]}%'"))
    end
    
    respond_with(@chapters = Chapter.all)
  end
  
  def new
    @chapter = Chapter.new
  end
  
  def edit
    @chapter = Chapter.find(params[:id])
  end
  
  def update
    @chapter = Chapter.find(params[:id])
    
    if @chapter.update_attributes(params[:chapter])
      redirect_to chapters_path, :notice => "Updated successully!"
    else
      render action: "edit"
    end
  end
  
  def create
    @chapter = Chapter.new(params[:chapter])
    
    if @chapter.save
      redirect_to chapters_path, :notice => "Created successully!"
    else
      render action: "new"
    end
  end
end
