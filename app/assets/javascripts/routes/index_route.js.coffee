TweetPoster.IndexRoute = Ember.Route.extend
  events:
    addTime: (tweet) ->
      tweet.get('times').createRecord()

  model: ->
    TweetPoster.Tweet.find()
