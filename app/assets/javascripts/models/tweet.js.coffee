TweetPoster.Tweet = DS.Model.extend
  text: DS.attr('string')
  times: DS.hasMany('TweetPoster.Time')
