TweetPoster.FixtureAdapter = DS.FixtureAdapter.extend()

TweetPoster.Store = DS.Store.extend
  adapter: TweetPoster.FixtureAdapter

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
