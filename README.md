# Omniauth::Streamlabs

An Omniauth strategy for Streamlabs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-streamlabs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-streamlabs

## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitch, ENV["STREAMLABS_CLIENT_ID"], ENV["STREAMLABS_CLIENT_SECRET"]
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  provider: 'streamlabs',
  uid: 12345678,
  info: {
    display_name: 'johndoe',
    name: 'JohnDoe',
  },
  credentials: {
    token: 'asdfghjklasdfghjklasdfghjkl', # OAuth 2.0 access_token, which you may wish to store
    expires: false # this will always be false
  },
  extra: {
    raw_info: {
      display_name: 'johndoe',
      name: 'JohnDoe',
      _id: 12345678,
    }
  }
}

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/prognostikos/omniauth-streamlabs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

