class ApplicationController < ActionController::Base
  def index
    flash.notice = 'No page found at that address'
    redirect_to root_path
  end
  
end
