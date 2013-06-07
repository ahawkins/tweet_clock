TweetClock.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    # not sure where else to put this
    TweetClock.Tweet.find()
    @controllerFor('profile').set 'model', TweetClock.Profile.find('me')
    @controllerFor('settings').set 'model', TweetClock.Settings.find('me')
