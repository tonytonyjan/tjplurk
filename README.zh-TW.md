## 安裝

```
$ gem install tjplurk
```

## 使用

```ruby
api = Tjplurk::API.new CONSUMER_KEY, CONSUMER_SECRET, TOKEN_KEY, TOKEN_SECRET
api.request('/APP/Users/me') # => Hash object
api.request('/APP/Timeline/plurkAdd', content: 'haha', qualifier: 'says') # => Hash object
```

如果將 `CONSUMER_KEY`, `CONSUMER_SECRET`, `TOKEN_KEY`, `TOKEN_SECRET` 逐行寫在 `$HOME/.tjplurk`，`Tjplurk::API.new` 就可以不用給參數，舉例：

```ruby
api = Tjplurk::API.new
api.request('/APP/Users/me')
```

## 在命令列中使用

第一次使用的時候，可以先透過 `tjplurk auth` 取得 access token：

```
$ tjplurk auth CONSUMER_KEY CONSUMER_SECRET
Authorize URL: http://www.plurk.com/OAuth/authorize?oauth_token=************
Enter Verification Number: *****
Key & secret successfully saved to "$HOME/.tjplurk".
```

你的所有 key/secret 將會被存在 `$HOME/.tjplurk`，然後我們就可以使用 Plurk API 了：

```
$ tjplurk api /APP/Users/me
$ tjplurk api /APP/Timeline/plurkAdd "content=hello world" qualifier=says
```

更多使用方式請參考： http://www.plurk.com/API

### 讓輸出結果更漂漂

```
$ tjplurk api /APP/Users/me | python -mjson.tool
```

```
$ tjplurk api /APP/Users/me | ruby -rjson -e 'puts JSON.pretty_generate JSON.parse(ARGF.read)'
```

### 指令

```
tjplurk auth CONSUMER_KEY CONSUMER_SECRET  # get access token interactivly.
tjplurk api PATH ["FOO=BAR" ...]           # send an API request.
```

## 開發

在執行 `rspec` 之前，請先確保 `$HOME/.tjplurk` 已設定。