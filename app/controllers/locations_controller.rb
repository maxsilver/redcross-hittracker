class LocationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @regions = Region.all
    
    if params[:start_date] && params[:end_date]
      @start_date = Date.parse params[:start_date]
      @end_date   = Date.parse params[:end_date]
    else
      @start_date = Hit.earliest_reported_on
      @end_date   = Hit.latest_reported_on
    end
    
    @date_range = @start_date..@end_date
  end
end
