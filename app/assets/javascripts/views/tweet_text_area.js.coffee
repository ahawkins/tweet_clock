TweetClock.TweetTextArea = Ember.TextArea.extend
  maxlength: 140
  placeholder: 'Tweet it, tweet it good'
  blur: ->
    @get('controller').finishedChangingText()
