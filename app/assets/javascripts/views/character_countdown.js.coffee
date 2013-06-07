TweetClock.CharacterCountdown = Ember.View.extend
  tagName: 'p'

  classNameBindings: ['counterClass']

  counterClass: (->
    count = @get('count')

    switch
      when count < 20 then 'text-error'
      when count < 60 then 'text-warning'
      else 'muted'
  ).property('count')

  template: Ember.Handlebars.compile """
    {{view.count}} characters remaining
  """
