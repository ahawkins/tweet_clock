desc "Send tweets"
task :tweet => :environment do
  DeliverTweets.run!
end
