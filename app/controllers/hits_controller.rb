class HitsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @hits = Hit.all
  end
  
  def new
    @hit = Hit.new()
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
