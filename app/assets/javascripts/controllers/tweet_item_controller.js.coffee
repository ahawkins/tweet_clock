TweetPoster.TweetItemController = Ember.ObjectController.extend
  isDisabled: Ember.computed.alias('isSaving', readOnly: true)

  finishedChangingText: ->
    @get('store').commit()
