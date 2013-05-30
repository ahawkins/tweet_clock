TweetPoster.Tweet = DS.Model.extend
  text: DS.attr('string')
  times: DS.hasMany('TweetPoster.Time')

  date: ((key, value) ->
    if(arguments.length == 2) 
      @get('times').setEach 'date', value
      value
    else
      @get('times.firstObject.date') || new Date()
  ).property()
