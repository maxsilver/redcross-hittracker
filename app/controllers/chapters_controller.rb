class ChaptersController < ApplicationController
  before_filter :authenticate_user!

  def index
  end
end
