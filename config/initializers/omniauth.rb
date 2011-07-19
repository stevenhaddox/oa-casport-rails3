Rails.application.config.middleware.use OmniAuth::Builder do
  provider :casport, {
    :setup => true,
    :cas_server => 'http://cas.dev/users'
    #:cas_server => 'http://oa-cas.slkdemos.com/users'
  }
end