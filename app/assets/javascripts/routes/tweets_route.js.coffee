TweetClock.TweetsRoute = Ember.Route.extend
  events:
    addTime: (tweet) ->
      tweet.get('times').createRecord 
        date: tweet.get('date')
        hour: 1
        minute: 10
        meridian: 'PM'
        offset: -8

    removeTime: (tweet, time) ->
      tweet.get('times').removeObject time
      @get('store').commit()

    addTweet: ->
      transaction = @get('store').transaction()
      settings = @controllerFor 'settings'

      tweet = TweetClock.Tweet.createRecord date: new Date()

      if Ember.isEmpty settings.get('defaultTimes')
        tweet.get('times').createRecord 
          date: tweet.get('date')
          hour: 1 
          minute: 10,
          meridian: 'PM',
          offset: -8
      else
        settings.get('defaultTimes').forEach (time) ->
          tweet.get('times').createRecord 
            date: tweet.get('date')
            hour: time.get('hour')
            minute: time.get('minute')
            meridian: time.get('meridian')
            offset: time.get('offset')


      transaction.add(tweet)
      transaction.commit()

    addDefaultTime: ->
      settings = @controllerFor('settings').get('model')
      transaction = @get('store').transaction()

      settings.get('defaultTimes').createRecord 
        hour: 1 
        minute: 10,
        meridian: 'PM',
        offset: -8

      transaction.add settings
      transaction.commit()

    removeDefaultTime: (time) ->
      settings = @controllerFor('settings').get('model')
      settings.get('defaultTimes').removeObject time
      @get('store').commit()

  model: ->
    TweetClock.Tweet.all()
