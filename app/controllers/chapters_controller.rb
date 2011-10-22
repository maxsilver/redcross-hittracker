class ChaptersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  
  def index
    respond_with(@chapters = Chapter.where("name like '%#{params[:q]}%'"))
  end
end
