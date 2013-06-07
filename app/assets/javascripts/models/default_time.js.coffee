TweetClock.DefaultTime = DS.Model.extend
  hour: DS.attr('number')
  minute: DS.attr('number')
  meridian: DS.attr('string')
  offset: DS.attr('number')
  settings: DS.belongsTo('TweetClock.Settings')
