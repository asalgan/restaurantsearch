OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '561659067248763', 'e1a4c5f44c0e3aa765347cc55fdb5c6a', :display => "popup"
end