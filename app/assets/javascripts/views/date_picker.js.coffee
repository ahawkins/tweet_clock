TweetClock.DatePicker = Ember.TextField.extend
  classNames: ['date-picker']

  textToDateTransform: ((key, value) ->
    if arguments.length == 2
      if value && /\d{4}-\d{2}-\d{2}/.test(value)
        parts = value.split '-'
        date = new Date()
        date.setYear parts[0]
        date.setMonth parts[1] - 1
        date.setDate parts[2]

        @set 'date',  date
      else
        @set 'date', null
    else if !value && @get('date')
      month =  @get('date').getMonth() + 1
      date = @get('date').getDate()

      month = "0#{month}" if month < 10
      date = "0#{date}" if date < 10

      "%@-%@-%@".fmt @get('date').getFullYear(), month, date
    else
      value
  ).property()

  placeholder: "yyyy-mm-dd"
  size: 8

  valueBinding: "textToDateTransform"
