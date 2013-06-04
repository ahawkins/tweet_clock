class Tweet < ActiveRecord::Base
  attr_accessible :text, :times

  belongs_to :user

  serialize :times

  def initialize(*args)
    super
    self.times ||= []
  end
end
