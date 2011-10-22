class HitsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def create
    redirect_to hits_path
  end
end
