TweetPoster.HourSelect = Ember.Select.extend
  content: [1..12]

TweetPoster.MinuteSelect = Ember.Select.extend
  content: [0..59]

TweetPoster.TimeZoneSelect = Ember.Select.extend
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
