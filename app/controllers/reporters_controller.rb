class ReportersController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :json, :html
  
  def index
    respond_with(@reporters = Reporter.where("name like '%#{params[:q]}%'"))
  end  
  def new
    @reporter = current_user.reporters.build
  end
  
  def edit
    @reporter = Reporter.find(params[:id])
  end
  
  def update
    @reporter = Reporter.find(params[:id])
    
    if @reporter.update_attributes(params[:reporter])
      redirect_to media_path, :notice => "Updated successully!"
    else
      render action: "edit"
    end
  end
  
  def create
    @reporter = Reporter.new(params[:reporter])
    
    if @reporter.save
      redirect_to media_path, :notice => "Created successully!"
    else
      render action: "new"
    end
  end
end

