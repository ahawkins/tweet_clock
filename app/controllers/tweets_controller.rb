class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all

    respond_to do |format|
      format.json { render json: @tweets }
    end
  end

  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.json { render json: @tweet }
    end
  end

  def create
    @tweet = Tweet.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.json { head :no_content }
      else
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
