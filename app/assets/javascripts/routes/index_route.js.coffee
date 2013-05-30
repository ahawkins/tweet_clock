TweetPoster.IndexRoute = Ember.Route.extend
  events:
    addTime: (tweet) ->
      tweet.get('times').createRecord()

    removeTime: (tweet, time) ->
      tweet.get('times').removeObject time
      # Commit here 
      @get('store').commit()

  model: ->
    TweetPoster.Tweet.find()
