# Nelson
[![Gem Version](https://badge.fury.io/rb/nelson.svg)](http://badge.fury.io/rb/nelson)
[![Build Status](https://travis-ci.org/pducks32/nelson.svg)](https://travis-ci.org/pducks32/nelson)

A library for building, manipulating, displaying, and solving math expressions using a fluent API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nelson'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nelson

## Usage

```ruby
expression = Nelson.product_of(6).and(5).square.build
expression.to_s #=> (6*5)^2
expression.evaluate #=> 900
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pducks32/nelson.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
