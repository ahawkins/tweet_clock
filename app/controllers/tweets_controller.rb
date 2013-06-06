class TweetsController < ApplicationController
  before_filter :authenticate!

  delegate :tweets, to: :current_user

  def index
    @tweets = tweets

    if stale? :last_modified => @tweets.maximum(:updated_at)
      respond_to do |format|
        format.json { render json: @tweets }
      end
    end
  end

  def show
    @tweet = tweets.find(params[:id])

    respond_to do |format|
      format.json { render json: @tweet }
    end
  end

  def create
    @tweet = tweets.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tweet = tweets.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.json { head :no_content }
      else
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet = tweets.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
