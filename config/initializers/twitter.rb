Twitter.configure do |config|
  config.consumer_key = ENV.fetch('TWITTER_KEY')
  config.consumer_secret = ENV.fetch('TWITTER_SECRET')
end
