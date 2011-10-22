class HitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :grab_required_options

  def index
    if params[:commit]

      conditions = {}

      if media_outlet = MediaOutlet.where(:id => params[:hit][:media_outlet_id])
        conditions[:media_outlet_id] = media_outlet
      end

      if chapter = Chapter.where(:id => params[:hit][:chapter_id])
        conditions[:chapter_id] = chapter
      end

      if reporter = Reporter.where(:id => params[:hit][:reporter_id])
        conditions[:reporter_id] = reporter
      end

      # if params[:hit][:title] && params[:hit][:title].length > 0
      #   conditions['title'] = " LIKE %{params[:title]}%"
      # end

      # search << Hit.tagged_with(params[:tags].split(',')) if params[:tags]
      # if chapter = Chapter.find(params[:hit][:chapter_id])
      #   conditions[:chapter_id] = chapter
      # end

      if params[:tags] && params[:start_date] && params[:end_date]
        @hits = Hit.during(Date.parse(params[:start_date])..Date.parse(params[:end_date])).tagged_with(params[:tags].split(','))
        # search << Hit.during(Date.parse(params[:start_date])..Date.parse(params[:end_date])) if params[:start_date] && params[:end_date]
      else
        @hits = Hit.find(:all, :conditions => conditions)
      end

    else
      @hits = Hit.all
    end
  end

  def new
    @hit = Hit.new()
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

  def create
    @hit = current_user.hits.build(params[:hit])
    if @hit.save
      User.subscribed.each { |u| SubscriptionMailer.new_hit(@hit, current_user).deliver }
      redirect_to hits_path
    else
      render :new
    end
  end


  def grab_required_options
    @reporters = Reporter.all
    @chapters = Chapter.all
    @press_releases = PressRelease.all
    @media_outlets = MediaOutlet.all
  end


end
