TweetClock.Time = DS.Model.extend
  date: DS.attr('date')
  hour: DS.attr('number')
  minute: DS.attr('number')
  meridian: DS.attr('string')
  offset: DS.attr('number')
  tweet: DS.belongsTo('TweetClock.Tweet')
