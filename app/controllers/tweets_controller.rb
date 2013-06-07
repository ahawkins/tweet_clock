class TweetsController < ApplicationController
  before_filter :authenticate!

  delegate :tweets, to: :current_user

  def index
    if stale? :last_modified => tweets.maximum(:updated_at)
      json tweets
    end
  end

  def show
    tweet = tweets.find params[:id]
    json tweet
  end

  def create
    tweet = tweets.new params[:tweet]

    if tweet.save
      json tweet, status: :created, location: tweet
    else
      json tweet.errors, status: :unprocessable_entitty
    end
  end

  def update
    tweet = tweets.find params[:id]

    if tweet.update_attributes params[:tweet]
      head :no_content
    else
      json tweet.errors, status: :unprocessable_entitty
    end
  end

  def destroy
    tweet = tweets.find(params[:id])
    tweet.destroy

    head :no_content
  end
end
