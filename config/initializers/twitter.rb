Twitter.configure do |config|
  config.consumer_key = ENV.fetch('TWITTER_KEY') { 'default-doesnt-work' }
  config.consumer_secret = ENV.fetch('TWITTER_SECRET') { 'default-doesnt-work' }
end
