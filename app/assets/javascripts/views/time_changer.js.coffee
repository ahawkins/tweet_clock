FixedSelect = Ember.Select.extend
  init: ->
    this._super()
    # FIXME: https://github.com/emberjs/ember.js/issues/2763
    this.valueDidChange()
    this.on("didInsertElement", this, this._triggerChange)
    this.on("change", this, this._change)

TweetPoster.HourSelect = FixedSelect.extend
  content: [1..12]

TweetPoster.MinuteSelect = FixedSelect.extend
  content: [0..59]

TweetPoster.TimeZoneSelect = FixedSelect.extend
  content: [
    Ember.Object.create name: 'PST', offset: -8
    Ember.Object.create name: 'EST', offset: -5
    Ember.Object.create name: 'UTC', offset: 0
    Ember.Object.create name: 'CET', offset: 1
  ]

  optionValuePath: 'content.offset'
  optionLabelPath: 'content.name'



TweetPoster.AmPmSelect = Ember.Select.extend
  content: ['AM', 'PM']
