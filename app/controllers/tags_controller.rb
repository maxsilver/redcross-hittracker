class TagsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # respond_to do |format|
    #   format.json do
    #     if params[:q]
    #       data = ActsAsTaggableOn::Tag.named_like(params[:q])
    #       data << params[:q].split(" ").collect {|tag_name| ActsAsTaggableOn::Tag.new(:name => tag_name) }
    #       respond_with(@tags = data.first)
    #     else
    #       respond_with(@chapters = ActsAsTaggableOn::Tag.all)
    #     end
    #   end
    #   format.html do
        @tags = ActsAsTaggableOn::Tag.all
    #   end
    # end
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @reporters = Reporter.tagged_with(@tag.name)
    @hits = Hit.tagged_with(@tag.name)
  end
end
