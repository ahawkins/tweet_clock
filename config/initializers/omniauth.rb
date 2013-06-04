Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer , :fields => [:name, :nickname], :uid_field => :name if Rails.env.development?
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
