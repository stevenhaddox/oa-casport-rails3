class User < ActiveRecord::Base
  attr_protected :id, :uid, :provider

  private
  def create_with_omniauth(auth_hash)
    create! do |user|
      user.provider   = auth_hash['provider']
      user.uid        = auth_hash['uid']
      user.email      = auth_hash['user_info']['email']
      user.first_name = auth_hash['extra']['user_hash']['first_name']
      user.last_name  = auth_hash['extra']['user_hash']['last_name']
      user.phone      = auth_hash['extra']['user_hash']['phone']
      user.cell       = auth_hash['extra']['user_hash']['cell']
      user.address    = auth_hash['extra']['user_hash']['address']
      user.address2   = auth_hash['extra']['user_hash']['address2']
      user.city       = auth_hash['extra']['user_hash']['city']
      user.state      = auth_hash['extra']['user_hash']['state']
      user.country    = auth_hash['extra']['user_hash']['country']
    end
  end

end
