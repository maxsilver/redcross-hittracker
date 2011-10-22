class TagsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  
  def index
    if params[:q]
      respond_with(@tags = ActsAsTaggableOn::Tag.named_like(params[:q]))
    else
      respond_with(@chapters = ActsAsTaggableOn::Tag.all)
    end
  end
end
