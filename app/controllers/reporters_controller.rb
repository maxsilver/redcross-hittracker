class ReportersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  
  def index
    respond_with(@reporters = Reporter.where("name like '%#{params[:q]}%'"))
  end
end
