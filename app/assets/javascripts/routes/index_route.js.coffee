TweetClock.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'tweets'

