TweetClock.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    # not sure where else to put this
    TweetClock.Tweet.find()

TweetClock.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'tweets'

TweetClock.TweetsRoute = Ember.Route.extend
  events:
    addTime: (tweet) ->
      tweet.get('times').createRecord 
        date: tweet.get('date')
        hour: 1
        minute: 15
        merdian: 'PM'
        offset: -8

    removeTime: (tweet, time) ->
      tweet.get('times').removeObject time
      # Commit here 
      @get('store').commit()

    addTweet: ->
      transaction = @get('store').transaction()

      tweet = TweetClock.Tweet.createRecord date: new Date()
      tweet.get('times').createRecord 
        date: tweet.get('date')
        hour: 1 
        minute: 15,
        merdian: 'PM',
        offset: -8

      transaction.add(tweet)
      transaction.commit()

  model: ->
    TweetClock.Tweet.all()
