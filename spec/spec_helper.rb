require "coco"

require "xiami"

require "webmock"
WebMock.disable_net_connect!
WebMock.allow_net_connect! if ENV['REAL_HTTP']

RSpec.configure do |config|
  config.fail_fast = true
  config.order = 'random'
end

def fixture(path, extension='xml')
  File.new(File.expand_path("../fixtures/#{path}.#{extension}", __FILE__))
end

HTTPI.logger = Logger.new('/dev/null')

unless ENV['REAL_HTTP']
  include WebMock::API

  song_xml_pattern = /http:\/\/www\.xiami\.com\/widget\/xml-single\/uid\/0\/sid\/(\d+)/

  stub_request(:any, song_xml_pattern).to_return(lambda { |request| { body: fixture('songs/' + request.uri.path.match(/(\d+)$/)[0]) } })

  album_pattern = /http:\/\/www\.xiami\.com\/album\/(\d+)/
  album_handler = lambda { |request| { body: fixture('albums/' + request.uri.path.match(/(\d+)$/)[0], 'html') } }
  stub_request(:any, album_pattern).to_return(album_handler)

  song_pattern = /http:\/\/www\.xiami\.com\/song\/(\d+)/
  song_handler = lambda { |request| { body: fixture('songs/' + request.uri.path.match(/(\d+)$/)[0], 'html') } }
  stub_request(:any, song_pattern).to_return(song_handler)

  images_handler = lambda { |request| { body: fixture(request.uri.path.match(/(.+)\.jpg$/)[1], 'jpg') } }
  stub_request(:any, /img\.xiami\.net/).to_return(images_handler)
end