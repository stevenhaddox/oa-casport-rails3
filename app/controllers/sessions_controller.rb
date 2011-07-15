class SessionsController < ApplicationController
  
  def setup
    #prod would be:
    #request.env['omniauth.strategy'].options[:dn] = request.env['SSL_CLIENT_S_DN']
    request.env['omniauth.strategy'].options[:dn] = '1'
    render :text => 'Setup compelte', :status => 404
  end
  
  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid']) || User.create_with_omniauth(auth_hash)
    session[:user_id] = user.id
    session[:expires_at] = 24.hours.from_now
    redirect_to root_url, :notice => 'Thanks for logging in via CAS!'
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'You have signed out successfully.'
  end
  
  def failure
    raise params.to_yaml
  end
end
