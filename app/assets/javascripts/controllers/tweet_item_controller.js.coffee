TweetPoster.TweetItemController = Ember.ObjectController.extend
  isDisabled: Ember.computed.alias('isSaving', readOnly: true)

  finishedChangingText: ->
    @get('store').commit()

  dateDidChange: (->
    return if @get('isNew')
    transaction = @get('store').transaction()
    transaction.add @get('model')
    transaction.commit()
  ).observes('date')

  remainingCharacters: (->
    return unless @get('text')
    140 - @get('text').length
  ).property('text')
