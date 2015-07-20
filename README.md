# xiami gem

[![Build Status](https://travis-ci.org/forresty/xiami.svg)](https://travis-ci.org/forresty/xiami)
[![Code Climate](https://codeclimate.com/github/forresty/xiami/badges/gpa.svg)](https://codeclimate.com/github/forresty/xiami)
[![Coverage Status](https://coveralls.io/repos/forresty/xiami/badge.png)](https://coveralls.io/r/forresty/xiami)
[![Gem Version](https://badge.fury.io/rb/xiami.svg)](http://badge.fury.io/rb/xiami)
[![Dependency Status](https://www.versioneye.com/user/projects/5471d5e19dcf6df5ea000ee9/badge.svg?style=flat)](https://www.versioneye.com/user/projects/5471d5e19dcf6df5ea000ee9)

retrieve songs from xiami.com

## Installation

depends on [curb](https://github.com/taf2/curb) gem, on Ubuntu install its dependencies with

`$ sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev`

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

[{:id=>1079377,
  :title=>"Creep",
  :artist=>"Radiohead",
  :album=>"《Pablo Honey》"},
 {:id=>1079676,
  :title=>"No Surprises",
  :artist=>"Radiohead",
  :album=>"《OK Computer》"},
 {:id=>2092783,
  :title=>"Fake Plastic Trees",
  :artist=>"Radiohead",
  :album=>"《The Best Of》"},
 {:id=>2053304,
  :title=>"Last Flowers",
  :artist=>"Radiohead",
  :album=>"《In Rainbows》"},
 {:id=>1769562528,
  :title=>"Creep (Acoustic)",
  :artist=>"Radiohead",
  :album=>"《Pablo Honey》"},
 {:id=>1079509,
  :title=>"High and Dry",
  :artist=>"Radiohead",
  :album=>"《The Bends》"},
 {:id=>1769706099,
  :title=>"Last Flowers",
  :artist=>"日本原声带(Radiohead)",
  :album=>"《告白 オリジナル・サウンドトラック》"},
 {:id=>1079670,
  :title=>"Exit Music (For a Film)",
  :artist=>"Radiohead",
  :album=>"《OK Computer》"},
 {:id=>1079668,
  :title=>"Paranoid Android",
  :artist=>"Radiohead",
  :album=>"《OK Computer》"},
 {:id=>1769562531,
  :title=>"Faithless The Wonder Boy",
  :artist=>"Radiohead",
  :album=>"《Pablo Honey》"},
 {:id=>1769562526,
  :title=>"Blow Out (Remix)",
  :artist=>"Radiohead",
  :album=>"《Pablo Honey》"},
 {:id=>1769562522,
  :title=>"Thinking About You (Demo)",
  :artist=>"Radiohead",
  :album=>"《Pablo Honey》"}]
```

```ruby
Xiami::Song.search_all 'dido'

[{:id=>1412106, :title=>"Thank You", :artist=>"Dido", :album=>"《No Angel》"},
 {:id=>1412111, :title=>"My Life", :artist=>"Dido", :album=>"《No Angel》"},
 {:id=>1412204, :title=>"Life for Rent", :artist=>"Dido", :album=>"《Life for Rent》"},
 {:id=>1769019622, :title=>"Summer", :artist=>"Dido", :album=>"《Safe Trip Home》"},
 {:id=>1238956, :title=>"Stan", :artist=>"Eminem(Eminem;Dido)", :album=>"《The Marshall Mathers LP》"},
 {:id=>1412202, :title=>"White Flag", :artist=>"Dido", :album=>"《Life for Rent》"},
 {:id=>1412211, :title=>"This Land Is Mine", :artist=>"Dido", :album=>"《Life for Rent》"},
 {:id=>3394860, :title=>"Don't Believe In Love", :artist=>"Dido", :album=>"《Safe Trip Home》"},
 {:id=>3394861, :title=>"Quiet Times", :artist=>"Dido", :album=>"《Safe Trip Home》"},
 {:id=>1412101, :title=>"Here with Me", :artist=>"Dido", :album=>"《No Angel》"},
 {:id=>1771573992, :title=>"No Freedom", :artist=>"Dido", :album=>"《Girl Who Got Away》"},
 {:id=>2070881, :title=>"Thankyou", :artist=>"Dido", :album=>"《One Step Too Far》"},
 {:id=>1773641840, :title=>"Thank You (Acoustic)", :artist=>"Dido", :album=>"《Thank You (Acoustic)》"},
 {:id=>2070875, :title=>"Stan", :artist=>"Dido", :album=>"《One Step Too Far》"},
 {:id=>1412110, :title=>"I'm No Angel", :artist=>"Dido", :album=>"《No Angel》"},
 {:id=>1769665731, :title=>"Paris", :artist=>"Dido", :album=>"《White Flag》"},
 {:id=>1771528775, :title=>"Let Us Move On", :artist=>"Dido(Dido;Kendrick Lamar)", :album=>"《Girl Who Got Away》"},
 {:id=>1769023351, :title=>"Christmas Day", :artist=>"Dido", :album=>"《No Angel》"},
 {:id=>3394867, :title=>"The Day Before The Day", :artist=>"Dido", :album=>"《Safe Trip Home》"},
 {:id=>2088107, :title=>"Stan", :artist=>"Eminem(Eminem;Dido)", :album=>"《Curtain Call: The Hits》"},
 {:id=>195909, :title=>"Don't You Trust Me?", :artist=>"2Pac(2Pac;Dido)", :album=>"《Loyal To The Game》"},
 {:id=>1771698918, :title=>"Quiet Times (Acoustic)", :artist=>"Dido", :album=>"《No Freedom》"},
 {:id=>1771574000, :title=>"Happy New Year", :artist=>"Dido", :album=>"《Girl Who Got Away》"},
 {:id=>3394865, :title=>"Look No Further", :artist=>"Dido", :album=>"《Safe Trip Home》"},
 {:id=>1412212, :title=>"See the Sun / Closer", :artist=>"Dido", :album=>"《Life for Rent》"},
 {:id=>1412102, :title=>"Hunter", :artist=>"Dido", :album=>"《No Angel》"},
 {:id=>3394869, :title=>"Burnin Love", :artist=>"Dido(Dido;Citizen Cope)", :album=>"《Safe Trip Home》"},
 {:id=>1771573996, :title=>"End Of Night", :artist=>"Dido", :album=>"《Girl Who Got Away》"},
 {:id=>1771600486, :title=>"No Freedom", :artist=>"Dido", :album=>"《No Freedom》"},
 {:id=>1412103, :title=>"Don't Think of Me", :artist=>"Dido", :album=>"《No Angel》"},
 {:id=>1772329745, :title=>"Thank You", :artist=>"Dido", :album=>"《Greatest Hits》"},
 {:id=>1772288720, :title=>"NYC", :artist=>"Dido", :album=>"《Greatest Hits》"},
 {:id=>1412209, :title=>"Sand in My Shoes", :artist=>"Dido", :album=>"《Life for Rent》"},
 {:id=>1772329748, :title=>"Life for Rent", :artist=>"Dido", :album=>"《Greatest Hits》"},
 {:id=>3416303, :title=>"Here With Me", :artist=>"Soundtrack(Dido)", :album=>"《Love Actually (The Original Soundtrack)》"},
 {:id=>1412104, :title=>"My Lover's Gone", :artist=>"Dido", :album=>"《No Angel》"},
 {:id=>1412210, :title=>"Do You Have a Little Time", :artist=>"Dido", :album=>"《Life for Rent》"},
 {:id=>1771573993, :title=>"Girl Who Got Away", :artist=>"Dido", :album=>"《Girl Who Got Away》"},
 {:id=>1772329744, :title=>"Here with Me", :artist=>"Dido", :album=>"《Greatest Hits》"},
 {:id=>3394862, :title=>"Never Want To Say It's Love", :artist=>"Dido", :album=>"《Safe Trip Home》"},
 {:id=>3394864, :title=>"It Comes And It Goes", :artist=>"Dido", :album=>"《Safe Trip Home》"},
 {:id=>3394863, :title=>"Grafton Street", :artist=>"Dido", :album=>"《Safe Trip Home》"},
...
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

### 0.4.0 / 2015-02-04

- use HTTPI, Virtus and allow http proxy setting

### 0.3.1 / 2015-01-25

- Song.search

### 0.3.0 / 2015-01-17

- changed `Song.new` interface, now it will not fetch song remotely

### 0.2.0 / 2015-01-12

- fetch all available album arts and default to the largest one

### 0.1.4 / 2015-01-12

- fetch largest album art available

### 0.1.3 / 2015-01-12

- parse HTML when XML fails

### 0.1.0 / 2014-12-17

- new `Song.fetch` method, will return nil when failed
