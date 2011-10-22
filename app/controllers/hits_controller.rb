class HitsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @hit = Hit.new()
  end
  
  def create
    redirect_to hits_path
  end
end
