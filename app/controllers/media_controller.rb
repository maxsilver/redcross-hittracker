class MediaController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @reporters = Reporter.all
    @media_outlets = MediaOutlet.all
  end
end
