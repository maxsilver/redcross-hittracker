class TagsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  
  def index
    if params[:q]
      data = ActsAsTaggableOn::Tag.named_like(params[:q])
      data << params[:q].split(" ").collect {|tag_name| ActsAsTaggableOn::Tag.new(:name => tag_name) }
      respond_with(@tags = data.first)
    else
      respond_with(@chapters = ActsAsTaggableOn::Tag.all)
    end
  end
end
