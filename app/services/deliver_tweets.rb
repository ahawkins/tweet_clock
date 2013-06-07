class DeliverTweets
  def self.run!
    Rails.logger.info "Starting tweet delivery..."

    Tweet.tweetable.find_each do |tweet|
      tweet.tweetable_times.each do |time|
        Rails.logger.info "Tweeting tweet #{tweet.id}"

        begin
          tweet.tweet_with_time! time
        rescue Twitter::Error::BadRequest => ex
          Rails.logger.error "Could not deliver Tweet: #{tweet.id}! #{ex.class} : #{ex}"
        end
      end
    end

    Rails.logger.info "Finished delivering tweets"
  end
end
