TweetPoster.FixtureSerializer = DS.FixtureSerializer.extend
  extractEmbeddedData: (hash, key) ->
    hash[key]

TweetPoster.FixtureAdapter = DS.FixtureAdapter.extend
  serializer: TweetPoster.FixtureSerializer

TweetPoster.Store = DS.Store.extend
  adapter: TweetPoster.FixtureAdapter

TweetPoster.FixtureAdapter.map TweetPoster.Tweet,
  times: { embedded: 'always' }

TweetPoster.Tweet.FIXTURES = [
  {
    id: '1',
    text: 'tweet 1',
    times: [
      { hour: 9, minute: 30, merdian: 'AM', offsset: -8 }
      { hour: 8, minute: 15, merdian: 'PM', offsset: 0 }
    ]
  },
  {
    id: '2',
    text: 'tweet 2',
    times: [
      { hour: 9, minute: 30, merdian: 'AM', offsset: -8 }
      { hour: 8, minute: 15, merdian: 'PM', offsset: 0 }
    ]
  },
  {
    id: '3',
    text: 'tweet 3',
    times: [
      { hour: 9, minute: 30, merdian: 'AM', offsset: -8 }
      { hour: 8, minute: 15, merdian: 'PM', offsset: 0 }
    ]
  },
  {
    id: '4',
    text: 'tweet 4',
    times: [
      { hour: 9, minute: 30, merdian: 'AM', offsset: -8 }
      { hour: 8, minute: 15, merdian: 'PM', offsset: 0 }
    ]
  }
]

# TweetPoster.Tweet.FIXTURES = []

# tweet = TweetPoster.Tweet.createRecord text: 'tweet 1'
# tweet.get('times').createRecord hour: 8, minute: 15, merdian: 'PM', offsset: 0

# tweet.get('store').commit()
