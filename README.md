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

### Search for songs

```ruby
Xiami::Song.search 'Radiohead'
```

### Fetch song

```ruby
Xiami::Song.fetch 42951

#<Xiami::Song:0x007fc85aad82a0
 @album=
  #<Xiami::Album:0x007fc85aaf0418
   @cover_url=
    "http://img.xiami.net/images/album/img24/724/34881343112513_4.jpg",
   @cover_urls=
    [{:url=>"http://img.xiami.net/images/album/img24/724/34881343112513_1.jpg",
      :size=>[100, 100]},
     {:url=>"http://img.xiami.net/images/album/img24/724/34881343112513_2.jpg",
      :size=>[152, 185]},
     {:url=>"http://img.xiami.net/images/album/img24/724/34881343112513_3.jpg",
      :size=>[55, 55]},
     {:url=>"http://img.xiami.net/images/album/img24/724/34881343112513_4.jpg",
      :size=>[528, 640]},
     {:url=>"http://img.xiami.net/images/album/img24/724/34881343112513_5.jpg",
      :size=>[185, 185]}],
   @id=3488,
   @name="Wake Up">,
 @artist=#<Xiami::Artist:0x007fc85ab6afb0 @id=724, @name="MC HotDog;张震岳">,
 @id=42951,
 @name="我爱台妹",
 @temporary_url=
  "http://m5.file.xiami.com/724/724/3488/42951_28196_l.mp3?auth_key=8ce0466ab660aa7d2f35d914f8cdfc67-1421193600-0-null">
```

## Credits

- [xiami_sauce gem](https://github.com/ranmocy/xiami_sauce)

## Contributing

1. Fork it ( https://github.com/forresty/xiami/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Changelog

### 0.2.0 / 2015-01-12

- fetch all available album arts and default to the largest one

### 0.1.4 / 2015-01-12

- fetch largest album art available

### 0.1.3 / 2015-01-12

- parse HTML when XML fails

### 0.1.0 / 2014-12-17

- new `Song.fetch` method, will return nil when failed
