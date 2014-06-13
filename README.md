## Install

    gem install tjplurk

## Usage

```ruby
api = Tjplurk::API.new CONSUMER_KEY, CONSUMER_SECRET, TOKEN_KEY, TOKEN_SECRET
api.request('/APP/Users/me') # => Hash object
api.request('/APP/Timeline/plurkAdd', content: 'haha', qualifier: 'says') # => Hash object
```

You can save your CONSUMER_KEY, CONSUMER_SECRET, TOKEN_KEY, TOKEN_SECRET in `$HOME/.tjplurk` per line, and `Tjplurk::API.new` will work as well, for example:

```ruby
api = Tjplurk::API.new
api.request('/APP/Users/me')
```

## Command Line Usage

For the first time, you should use `tjplurk auth` to get access token and secret:

```
$ tjplurk auth CONSUMER_KEY CONSUMER_SECRET
Authorize URL: http://www.plurk.com/OAuth/authorize?oauth_token=************
Enter Verification Number: *****
Key & secret successfully saved to "$HOME/.tjplurk".
```

Your consumer key/secret and token key/secret will be saved to `$HOME/.tjplurk`. Then you can use all Plurk API:

```
$ tjplurk api /APP/Users/me
$ tjplurk api /APP/Timeline/plurkAdd "content=hello world" qualifier=says
```

For more available API paths, see http://www.plurk.com/API

## Commands

```
tjplurk auth CONSUMER_KEY CONSUMER_SECRET  # get access token interactivly.
tjplurk api PATH ["FOO=BAR" ...]           # send an API request.
```

## Develop

Before running rspec, please create `$HOME/.tjplurk` first.