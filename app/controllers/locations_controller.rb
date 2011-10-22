class LocationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @regions = Region.all
  end
end
