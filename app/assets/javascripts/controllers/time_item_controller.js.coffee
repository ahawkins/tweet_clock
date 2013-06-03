TweetClock.TimeItemController = Ember.ObjectController.extend
  didBecomeDirty: (->
    @get('store').commit()
  ).observes('hour', 'minute', 'meridian', 'offset')
