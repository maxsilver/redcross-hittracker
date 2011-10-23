class ApplicationController < ActionController::Base
  protect_from_forgery

private
  def require_admin!
    redirect_to :back, :alert => "Only administrators have access to perform that task."
  end
end
