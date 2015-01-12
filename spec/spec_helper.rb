require "simplecov"
SimpleCov.start

require "coveralls"
Coveralls.wear!

require "xiami"

require "webmock"
WebMock.disable_net_connect!

def fixture(path)
  File.new(File.expand_path("../fixtures/#{path}.xml", __FILE__))
end

include WebMock::API

song_pattern = /http:\/\/www\.xiami\.com\/widget\/xml-single\/uid\/0\/sid\/(\d+)/

stub_request(:any, song_pattern).to_return(lambda { |request| { body: fixture('songs/' + request.uri.path.match(/(\d+)$/)[0]) } })

album_pattern = /http:\/\/www\.xiami\.com\/album\/(\d+)/

stub_request(:any, album_pattern).to_return(lambda { |request| { body: fixture('albums/' + request.uri.path.match(/(\d+)$/)[0]) } })