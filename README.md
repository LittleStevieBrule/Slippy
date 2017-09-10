<img src="https://dl.dropbox.com/s/2eoyll8t2ld3b6n/Slippy.png" alt="alt text" width="140" height="100">

# Slippy [![Build Status](https://travis-ci.org/LittleStevieBrule/Slippy.svg?branch=master)](https://travis-ci.org/LittleStevieBrule/Slippy)



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Slippy', :git => 'https://github.com/LittleStevieBrule/Slippy'
```

And then execute:

    $ bundle

## Usage

```ruby

require 'slippy'

run = Slippy.run(:fib) do |run|
  run.add_algorithm(:rec) do |n|
    n < 3 ? 1 : rec(n - 1) + rec(n - 2)
  end
    
  run.add_algorithm(:memo_rec) do |n, memo = [0, 1]|
    memo[n] ? memo[n] : memo_rec(n - 1, memo) + memo_rec(n - 2, memo)
  end
    
  run.add_data_set(*(5..15).step(5).to_a)
end
run.go # Result: Some meaningful output this is TODO
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Slippy.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

