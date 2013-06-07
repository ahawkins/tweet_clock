TweetClock.TweetsController = Ember.ArrayController.extend
  needs: ['profile', 'settings']
  sortProperties: ['date']

  profile: Ember.computed.alias('controllers.profile', readOnly: true)
  settings: Ember.computed.alias('controllers.settings', readOnly: true)
