# FilterMapHash

A simple Ruby gem that provides a `filter_map_hash` method for Hashes, combining filtering and mapping key-value pairs in one pass.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'filter_map_hash'
```

then execute:

```bash
bundle install
```

## Usage

Require the gem in your Ruby code:

```ruby
require 'filter_map_hash'
```

Call the method on the Hash you want to transform:

```ruby
input = { a: 1, b: 2, c: 3, d: 4 } 

result = FilterMapHash.filter_map_hash(input) do |key, value| 
  value * 2 if value.even? 
end 

puts result
```
```bash
Output: { b: 4, d: 8 }
```
Or, after including the instance method module into `Hash`, you can call it directly on any hash:

```ruby
input = { a: 1, b: 2, c: 3, d: 4 }

result = input.filter_map_hash do |key, value|
  value + 2 if value.odd?
end

puts result
```

```bash
Output: { a: 3, c: 5 }
```

The block passed to filter_map_hash receives each key and value from the hash, transforming the value or returning nil to exclude it from the result.

## Features

- Combines filtering and mapping of Hash key-value pairs in one iteration. 
- Simple and idiomatic Ruby implementation using yield.
- Returns a new Hash containing only the transformed key-value pairs that passed the filter.
- Useful for reducing boilerplate code when working with hashes.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thuktensingye/filter_map_hash. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/filter_map_hash/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FilterMapHash project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/filter_map_hash/blob/master/CODE_OF_CONDUCT.md).
