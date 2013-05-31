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
    return 140 unless @get('text')
    140 - @get('text').length
  ).property('text')

  humanDate: (->
    @get('date').toLocaleDateString()
  ).property('date')
