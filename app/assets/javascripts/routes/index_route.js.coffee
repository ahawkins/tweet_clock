TweetPoster.IndexRoute = Ember.Route.extend
  events:
    addTime: (tweet) ->
      tweet.get('times').createRecord()

    removeTime: (tweet, time) ->
      tweet.get('times').removeObject time

  model: ->
    TweetPoster.Tweet.find()
