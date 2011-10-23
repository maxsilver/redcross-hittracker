class ReportersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin!, :only => [:destroy]
  
  respond_to :json, :html
  
  def index
    if params[:q]
      respond_with(@reporters = Reporter.where("name like '%#{params[:q]}%'"))
    else
      respond_with(@reporters = Reporter.all)
    end
  end  

  def new
    @reporter = current_user.reporters.build
  end
  
  def create
    @reporter = Reporter.new(params[:reporter])
    if @reporter.save
      redirect_to media_path, :notice => "Created successully!"
    else
      render action: "new"
    end
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
  
  def destroy
    @reporter = Reporter.find(params[:id])
    @reporter.destroy
    redirect_to media_path
  end
end

