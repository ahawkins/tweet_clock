TweetClock.TweetsController = Ember.ArrayController.extend
  needs: ['profile']
  sortProperties: ['date']

  profile: Ember.computed.alias('controllers.profile', readOnly: true)
