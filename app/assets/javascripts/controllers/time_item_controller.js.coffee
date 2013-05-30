TweetPoster.TimeItemController = Ember.ObjectController.extend
  didBecomeDirty: (->
    return unless @get('isDirty')
    @get('store').commit()
  ).observes('isDirty')
