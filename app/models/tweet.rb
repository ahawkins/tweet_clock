class Tweet < ActiveRecord::Base
  attr_accessible :text, :times

  serialize :times

  def initialize(*args)
    super
    self.times ||= []
  end
end
