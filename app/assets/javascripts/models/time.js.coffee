TweetPoster.Time = DS.Model.extend
  hour: DS.attr('number')
  minute: DS.attr('number')
  meridian: DS.attr('string')
  offset: DS.attr('number')
  tweet: DS.belongsTo('TweetPoster.Tweet')
