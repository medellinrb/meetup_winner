# MeetupWinner

Choose a lucky winner from a meetup event

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'meetup_winner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meetup_winner

## Usage

Get an API key
https://secure.meetup.com/meetup_api/key/


```ruby
meetup_key = 12345
winner = MeetupWinner.new(meetup_key, 'medellin rb')
```

Returns the number of attendees
```ruby
winner.count
```

Attendance list
```ruby
winner.attendance
```

Choose a lucky winner
```ruby
winner.choose
```


If you are using iterm2 in Mac OS, attendance and choose methods returns also the picture in the console.
More info:
http://iterm2.com/images.html#/section/home

## Contributing

1. Fork it ( https://github.com/[my-github-username]/meetup_winner/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
