class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_user
  helper_method :current_user
  
  private
  def current_user
    session[:user_id] = nil if session[:expiry_time] && (Time.parse(session[:expiry_time]) < Time.now)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #redirect_to '/auth/casport' unless @current_user or (params[:controller] == 'sessions' && params[:provider] == 'casport')
  end
end
