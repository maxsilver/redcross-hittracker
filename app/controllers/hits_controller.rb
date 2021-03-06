class HitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin!, :only => [:destroy]

  def index
    if params[:commit]
      search_params = params['hit'].clone
      tags = params['hit']['tags']
      search_params.delete("tags")
      if tags && tags.length > 0 && tags.first.length > 0
        @search = Hit.tagged_with(tags).search(search_params)
      else
        @search = Hit.search(search_params)
      end
      @hits = @search.all
    else
      @hits = Hit.all
    end
    
    respond_to :html, :csv
  end
  
  def show
    @hit = Hit.find params[:id]
  end
  
  def duplicate
    hit           = Hit.find(params[:id])
    @hit          = hit.dup
    debugger
    @hit.tag_list = hit.tags
    @hit.save
    render :edit
  end

  def new
    @hit = Hit.new
  end

  def create
    @hit = current_user.hits.build(params[:hit])
    if @hit.save
      (User.subscribed.all - [current_user]).each { |u| SubscriptionMailer.new_hit(@hit, u).deliver }
      redirect_to hits_path
    else
      render :new
    end
  end

  def edit
    @hit = Hit.find(params[:id])
  end

  def update
    @hit = Hit.find(params[:id])
    if @hit.update_attributes(params[:hit])
      redirect_to hits_path, :notice => "Updated successully!"
    else
      render action: "edit"
    end
  end

  def destroy
    @hit = Hit.find(params[:id])
    @hit.destroy
    redirect_to hits_path
  end
end
