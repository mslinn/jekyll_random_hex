`jekyll_random_hex`
[![Gem Version](https://badge.fury.io/rb/jekyll_random_hex.svg)](https://badge.fury.io/rb/jekyll_random_hex)
===========

`jekyll_random_hex` is a Jekyll tag plugin that outputs a string of random hexadecimal characters of any length.
Defaults to a six-character string.


## Usage
Example: Generate 6 random characters:
```
{{ random_hex_string }}
```

Example: generate 20 random characters. Each hex digit expands to 2 characters, so 10 hex digits yields 20 characters.
```
{{ random_hex_string 10 }}
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll_random_hex'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll_random_hex


## Additional Information
More information is available on
[Mike Slinn&rsquo;s website](https://www.mslinn.com/blog/2020/10/03/jekyll-plugins.html).


## Development

After checking out the repo, run `bin/setup` to install dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.



### Build and Install Locally
To build and install this gem onto your local machine, run:
```shell
$ bundle exec rake install
```

The following also does the same thing:
```shell
$ bundle exec rake install
```

Examine the newly built gem:
```shell
$ gem info jekyll_random_hex

*** LOCAL GEMS ***

jekyll_random_hex (1.0.0)
    Author: Mike Slinn
    Homepage:
    https://github.com/mslinn/jekyll_random_hex
    License: MIT
    Installed at: /home/mslinn/.gems

    Generates Jekyll logger with colored output.
```


### Build and Push to RubyGems
To release a new version,
  1. Update the version number in `version.rb`.
  2. Commit all changes to git; if you don't the next step might fail with an unexplainable error message.
  3. Run the following:
     ```shell
     $ bundle exec rake release
     ```
     The above creates a git tag for the version, commits the created tag,
     and pushes the new `.gem` file to [RubyGems.org](https://rubygems.org).


## Contributing

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
