TweetClock.Tweet = DS.Model.extend
  text: DS.attr('string')
  times: DS.hasMany('TweetClock.Time')

  date: ((key, value) ->
    if(arguments.length == 2) 
      @get('times').setEach('date', value) if value
      value
    else
      @get('times.firstObject.date') || new Date()
  ).property()
