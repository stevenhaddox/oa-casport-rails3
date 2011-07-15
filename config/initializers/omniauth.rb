Rails.application.config.middleware.use OmniAuth::Builder do
  provider :casport, {
    :setup => true,
    :cas_server => 'http://cas.slkdemos.com/users/'
  }
end