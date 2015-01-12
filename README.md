# xiami gem

[![Build Status](https://travis-ci.org/forresty/xiami.svg)](https://travis-ci.org/forresty/xiami)
[![Code Climate](https://codeclimate.com/github/forresty/xiami/badges/gpa.svg)](https://codeclimate.com/github/forresty/xiami)
[![Coverage Status](https://coveralls.io/repos/forresty/xiami/badge.png)](https://coveralls.io/r/forresty/xiami)
[![Gem Version](https://badge.fury.io/rb/xiami.svg)](http://badge.fury.io/rb/xiami)
[![Dependency Status](https://www.versioneye.com/user/projects/5471d5e19dcf6df5ea000ee9/badge.svg?style=flat)](https://www.versioneye.com/user/projects/5471d5e19dcf6df5ea000ee9)

retrieve songs from xiami.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xiami'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xiami


## Usage

```ruby
Xiami::Song.new 42951
=> #<Xiami::Song:0x007f8f35c43b48 @id="42951", @name="我爱台妹", @album=#<Xiami::Album:0x007f8f35c63560 @id="3488", @name="Wake Up", @cover_url="http://img.xiami.net/images/album/img24/724/34881343112513_3.jpg">, @artist=#<Xiami::Artist:0x007f8f35c79cc0 @id="724", @name="MC HotDog;张震岳">, @temporary_url="http://m5.file.xiami.com/724/724/3488/42951_28196_l.mp3?auth_key=77abde259cd6566a5c4222b4cca7331c-1416441600-0-null">
```

Album art fetched in this way will be small (roughly 55x55) as it was retrieved from

[http://www.xiami.com/widget/xml-single/uid/0/sid/42951](http://www.xiami.com/widget/xml-single/uid/0/sid/42951)

![http://img.xiami.net/images/album/img24/724/34881343112513_3.jpg](http://img.xiami.net/images/album/img24/724/34881343112513_3.jpg)

If larger album art is desired, you can set

```ruby
Xiami.fetch_large_album_art = true
```

Then it will utilize the URL pattern in album art and retrieve a larger album art (often over 500x500)

![http://img.xiami.net/images/album/img24/724/34881343112513_4.jpg](http://img.xiami.net/images/album/img24/724/34881343112513_4.jpg)

## Credits

- [xiami_sauce gem](https://github.com/ranmocy/xiami_sauce)

## Contributing

1. Fork it ( https://github.com/forresty/xiami/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Changelog

### 0.1.4 / 2015-01-12

- fetch largest album art available

### 0.1.3 / 2015-01-12

- parse HTML will not fail when artist has no ID

### 0.1.2 / 2015-01-12

- parse HTML when XML fails

### 0.1.1 / 2015-01-05

- Xiami.fetch_large_album_art

### 0.1.0 / 2014-12-17

- new `Song.fetch` method, will return nil when failed
