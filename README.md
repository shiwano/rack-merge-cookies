# Rack::MergeCookies [![Build Status](https://secure.travis-ci.org/shiwano/rack-merge-cookies.png)](https://travis-ci.org/shiwano/rack-merge-cookies?branch=master)

Rack middleware to merge the user-defined header to cookies.

Example:

```
Cookie: foo=1; bar=2
X-Cookie: baz=3
```

This headers will be merged like this below.

```
Cookie: foo=1; bar=2; baz=3
```

## Installation

Add this line to your application's Gemfile:

    gem 'rack-merge-cookies'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-merge-cookies

## Ruby on Rails

To make the middleware available in all environments, open `config/application.rb` and add in `class Application < Rails::Application`:

```ruby
config.middleware.insert_before(ActionDispatch::Cookies, Rack::MergeCookies, header_name: 'X-COOKIE')
```

If you want to customize the environment in which the middleware is enabled edit the respective environment files instead.

You can verify the middleware positioning by typing `rake middleware` in the root of your application.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
