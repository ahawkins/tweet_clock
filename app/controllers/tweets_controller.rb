class TweetsController < ApplicationController
  rescue_from ActiveModel::StrictValidationFailed  do
    head :bad_request
  end

  before_filter :authenticate!

  delegate :tweets, to: :current_user

  def tweet_params
    params.require(:tweet).permit(:text, :times => [])
  end

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
    tweet = tweets.new tweet_params

    if tweet.save
      json tweet, status: :created, location: tweet
    else
      json tweet.errors, status: :unprocessable_entitty
    end
  end

  def update
    tweet = tweets.find params[:id]

    if tweet.update_attributes tweet_params
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
