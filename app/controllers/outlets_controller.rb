class OutletsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  
  def index
    respond_with(@media_outlets = MediaOutlet.where("name LIKE '%#{params[:q]}%'"))
  end
end
