class HitsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @hits = Hit.all
  end

  def new
    @hit = Hit.new()
    @media_outlets = MediaOutlet.all
    @reporters = Reporter.all
    @chapters = Chapter.all
    @press_releases = PressRelease.all
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

end
