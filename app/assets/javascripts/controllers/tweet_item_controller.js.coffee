TweetPoster.TweetItemController = Ember.ObjectController.extend
  isDisabled: Ember.computed.alias('isSaving', readOnly: true)

  date: ((key, value) ->
    if(arguments.length == 2) 
      @get('times').setEach 'date', value 
      value
    else
      @get('times.firstObject.date') || 'fake-date'
  ).property()

  finishedChangingText: ->
    @get('store').commit()
