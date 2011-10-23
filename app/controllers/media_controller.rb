class MediaController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @reporters = Reporter.all
    @media_outlets = MediaOutlet.all
    
    if params[:start_date] && params[:end_date]
      @start_date = Date.parse params[:start_date]
      @end_date   = Date.parse params[:end_date]
    else
      @start_date = Hit.earliest.reported_on
      @end_date   = Hit.latest.reported_on
    end
    
    @date_range = @start_date..@end_date
  end
end
