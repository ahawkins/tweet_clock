TweetPoster.TweetTextArea = Ember.TextArea.extend
  maxlength: 140
  blur: ->
    @get('controller').finishedChangingText()
