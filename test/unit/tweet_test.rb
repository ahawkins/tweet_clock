require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  fixtures :users

  def test_sets_the_time_from_the_earliest_time_given
    next_week, next_month = 1.week.from_now, 1.month.from_now

    tweet = Tweet.create! do |t|
      t.user = users(:adman65)
      t.times = [next_week.iso8601, next_month.iso8601]
    end

    assert_equal next_week.iso8601, tweet.time.iso8601
  end

  def test_tweetable_times_only_includes_times_in_the_past
    last_week, next_week = 1.week.ago, 1.week.from_now

    tweet = Tweet.create! do |t|
      t.user = users(:adman65)
      t.times = [last_week.iso8601, next_week.iso8601]
    end

    assert_equal 1, tweet.tweetable_times.size
    assert_equal last_week.iso8601, tweet.tweetable_times.first
  end

  def test_tweetable_only_includes_tweets_that_have_ramining_times
    sent_tweet = Tweet.create! do |t|
      t.user = users(:adman65)
      t.sent = true
    end

    unsent_tweet = Tweet.create! do |t|
      t.user = users(:adman65)
      t.sent = false
    end

    assert_includes Tweet.tweetable, unsent_tweet
    refute_includes Tweet.tweetable, sent_tweet
  end

  def test_raises_an_error_when_trying_to_tweet_something_too_long
    assert_raises ActiveModel::StrictValidationFailed do
      Tweet.create! do |t|
        t.text = "1" * 200
        t.user = users(:adman65)
      end
    end
  end
end
