require "xiami"

require "webmock"
WebMock.disable_net_connect!

def fixture(path)
  File.new(File.expand_path("../fixtures/#{path}.xml", __FILE__))
end

include WebMock::API

pattern = /http:\/\/www\.xiami\.com\/widget\/xml-single\/uid\/0\/sid\/(\d+)/

result = lambda do |request|
  { body: fixture(request.uri.path.match(/(\d+)$/)[0]) }
end

stub_request(:any, pattern).to_return(result)
