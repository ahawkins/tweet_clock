TweetPoster.FixtureAdapter = DS.FixtureAdapter.extend()

TweetPoster.RESTSerializer = DS.RESTSerializer.extend
  serialize: (record, options) ->
    if(record instanceof TweetPoster.Time) 
      @serializeTime(record)
    else
      @_super record, options

  extractRecordRepresentation: (loader, type, data, shouldSideload) ->
    data = @extractTime(data) if type == TweetPoster.Time
    @_super.apply this, arguments

  extractTime: (string) ->
    return string unless string.constructor == String

    regex = /(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):\d{2}([+\-]\d{2})/

    matches = string.match regex

    time = {}
    time.date = string

    hour = parseInt matches[4]

    if hour < 13
      time.hour = hour
      time.meridian = 'AM'
    else
      time.hour = hour - 12
      time.merdian = 'PM'

    time.minutes = parseInt matches[5]
    time.offset = parseInt matches[6]
    time

    time


  serializeTime: (record) ->
    date = record.get('date')
    year = date.getFullYear()

    month = date.getMonth() + 1
    month = "0#{month}" if month < 10

    day = date.getDate()
    day = "0#{day}" if day < 10

    hour = record.get('hour')
    meridian = record.get('meridian')

    if hour != 12 && meridian == 'PM'
      hour = hour + 12
    else if hour == 12 && meridian == 'AM'
      hour = 0

    hour = "0#{hour}" if hour < 10

    minute = record.get('minute')
    minute = "0#{minute}" if minute < 10

    offset = record.get('offset')

    sign = if offset > 0 then 1 else 0
    abs = Math.abs offset
    abs = "0#{abs}" if abs < 10
    zone = if sign then "+#{abs}" else "-#{abs}"

    "%@-%@-%@T%@:%@:00%@:00".fmt year, month, day, hour, minute, zone

TweetPoster.RESTAdapter = DS.RESTAdapter.extend
  serializer: TweetPoster.RESTSerializer

TweetPoster.RESTAdapter.map TweetPoster.Tweet,
  times: { embedded: 'always' }

TweetPoster.Store = DS.Store.extend
  adapter: TweetPoster.RESTAdapter

TweetPoster.Tweet.FIXTURES = [
  {
    id: '1',
    text: 'tweet 1',
    times: ['1', '2']
  },
  {
    id: '2',
    text: 'tweet 2',
    times: ['3', '4']
  },
  {
    id: '3',
    text: 'tweet 3',
    times: ['5', '6']
  },
  {
    id: '4',
    text: 'tweet 4',
    times: ['7', '8']
  }
]

TweetPoster.Time.FIXTURES = [
  { id: '1', hour: 9, minute: 30, meridian: 'AM', offset: -8 }
  { id: '2', hour: 8, minute: 15, meridian: 'PM', offset: 0 }
  { id: '3', hour: 9, minute: 30, meridian: 'AM', offset: -8 }
  { id: '4', hour: 8, minute: 15, meridian: 'PM', offset: 0 }
  { id: '5', hour: 9, minute: 30, meridian: 'AM', offset: -8 }
  { id: '6', hour: 8, minute: 15, meridian: 'PM', offset: 0 }
  { id: '7', hour: 9, minute: 30, meridian: 'AM', offset: -8 }
  { id: '8', hour: 8, minute: 15, meridian: 'PM', offset: 0 }
]
