class HitsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    
  end
  
  def new
    @hit = Hit.new()
  end
  
  def create
    @hit = Hit.new(params[:hit])
    if @hit.save
      redirect_to hits_path
    else
      render :new
    end
  end
    
end
