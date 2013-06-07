class TweetSerializer < ActiveModel::Serializer
  attributes :id

  attributes :text, :times

  attributes :sent?
end
