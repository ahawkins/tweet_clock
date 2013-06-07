class Tweet < ActiveRecord::Base
  delegate :access_token, :secret_token, to: :user

  scope :tweetable, -> { where(sent: false).order("time ASC") }

  validates! :text, length: { maximum: 140 }

  belongs_to :user

  serialize :times
  serialize :posted

  before_save :set_time

  def initialize(*args)
    super
    self.times ||= []
    self.posted ||= []
  end

  def tweetable_times
    untweeted_times.select { |t| Time.parse(t).past? }
  end

  def tweet_with_time!(time)
    tweet!
    mark_as_tweeted time
  end

  private
  def tweet!
    return if text.blank?
    client = Twitter::Client.new oauth_token: access_token, oauth_token_secret: secret_token
    client.update text
  end

  def mark_as_tweeted(time)
    self.posted << time
    self.sent = posted.size == times.size
    self.save
  end

  def set_time
    return if time
    return if times.empty?

    self.time = Time.parse times.first
  end

  def untweeted_times
    times.reject { |t| posted.include? t }
  end
end
