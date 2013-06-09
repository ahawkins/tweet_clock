TweetClock.HourSelect = Ember.Select.extend
  content: [1..12]

# Heroku only allows tasks to run every 10 minutes for free
# so, only allow users to select at 10 minute invervals
TweetClock.MinuteSelect = Ember.Select.extend
  content: [0..59].filter (i) ->
    i % 10 == 0

TweetClock.TimeZoneSelect = Ember.Select.extend
  content: [
    Ember.Object.create name: 'HST', offset: -10
    Ember.Object.create name: 'AST', offset: -9
    Ember.Object.create name: 'PST', offset: -8
    Ember.Object.create name: 'MST', offset: -7
    Ember.Object.create name: 'CST', offset: -6
    Ember.Object.create name: 'EST', offset: -5
    Ember.Object.create name: 'UTC', offset: 0
    Ember.Object.create name: 'CET', offset: 1
    Ember.Object.create name: 'EET', offset: 2
  ]

  optionValuePath: 'content.offset'
  optionLabelPath: 'content.name'

TweetClock.AmPmSelect = Ember.Select.extend
  content: ['AM', 'PM']
