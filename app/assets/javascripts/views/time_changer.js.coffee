FixedSelect = Ember.Select.extend
  init: ->
    this._super()
    # FIXME: https://github.com/emberjs/ember.js/issues/2763
    this.valueDidChange()
    this.on("didInsertElement", this, this._triggerChange)
    this.on("change", this, this._change)

TweetClock.HourSelect = FixedSelect.extend
  content: [1..12]

# Heroku only allows tasks to run every 10 minutes for free
# so, only allow users to select at 10 minute invervals
TweetClock.MinuteSelect = FixedSelect.extend
  content: [0..59].filter (i) ->
    i % 10 == 0

TweetClock.TimeZoneSelect = FixedSelect.extend
  content: [
    Ember.Object.create name: 'PST', offset: -8
    Ember.Object.create name: 'EST', offset: -5
    Ember.Object.create name: 'UTC', offset: 0
    Ember.Object.create name: 'CET', offset: 1
  ]

  optionValuePath: 'content.offset'
  optionLabelPath: 'content.name'

TweetClock.AmPmSelect = Ember.Select.extend
  content: ['AM', 'PM']
