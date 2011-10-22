class TagsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  
  def index
    respond_with(@tags = ActsAsTaggableOn::Tag.named_like(params[:q]))
  end
end
