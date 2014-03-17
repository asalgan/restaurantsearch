OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"], :display => "popup", :image_size => 'large'
end
