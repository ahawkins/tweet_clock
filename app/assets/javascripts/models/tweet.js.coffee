TweetPoster.Tweet = DS.Model.extend
  text: DS.attr('string')
  times: DS.hasMany('TweetPoster.Time')

  isCompletelyLoaded: (->
    !@get('isLoading') && @get('times.isLoaded')
  ).property('isLoading', 'times.isLoaded')
