class LocationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @regions = Region.all
    if params[:start_date] && params[:end_date]
      start_date = Date.parse params[:start_date]
      end_date = Date.parse params[:end_date]
      @date_range = start_date..end_date
    else
      @date_range = 1000.years.ago..1000.years.from_now
    end
  end
end
