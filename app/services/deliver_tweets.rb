class DeliverTweets
  def self.run!
    Tweet.tweetable.find_each do |tweet|
      tweet.tweetable_times.each do |time|
        begin
          tweet.tweet_with_time! time
        rescue Twitter::Error::BadRequest => ex
          Rails.logger.error "Could not deliver Tweet: #{tweet.id}! #{ex.class} : #{ex}"
        end
      end
    end
  end
end
