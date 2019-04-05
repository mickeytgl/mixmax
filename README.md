## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mixmax'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mixmax

## Usage

First you need to initialize a new instance of Mixmax and pass in your API key

```ruby
mixmax = Mixmax.new 'API_KEY'
```

If you're using rails, then you probably want to put it in your initializers:

**config/initializers/mixmax.rb**
```ruby
MixmaxApi = Mixmax.new Rails.applications.credentials.mixmax_secret_key
```

Now you can do stuff like:

```ruby
mixmax.sequences
# => [{"_id"=>"5ca6452dbf0cjs0jdf35800d7ed", "userId"=>"5ca50420262cdj2ie9361d39", "createdAt"=>"2019-04-04T17:55:57.201Z", "variables"=>["Email"], "linkTrackingEnabled"=>false, "fileTrackingEnabled"=>false, "notificationsEnabled"=>false, "name"=>"Mickey Mouse", "timezone"=>"America/Mexico_City", "stages"=>["5ca6452d9353js03kgfh20e5b8c2", "5ca64560cfj30dnwl5eef0ffa"], "bcc"=>nil, "cc"=>nil, "teamIds"=>nil}]
```
```ruby
mixmax.sequence_recipients 'SEQUENCE_ID'

recipients = '{
        "recipients": [{
              "email": "hello@mixmax.com",
              "variables": {
                  "name": "Hugo Brockman",
                  "email": "hello@mixmax.com"
              }
          },
          {
              "email": "careers@mixmax.com",
              "variables": {
                  "name": "Mixmax hello",
                  "email": "careers@mixmax.com"
              }
          }],
          "scheduledAt": 1490300970312
      }'

mixmax.add_to_sequence('SEQUENCE_ID', recipients)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mickeytgl/mixmax.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
