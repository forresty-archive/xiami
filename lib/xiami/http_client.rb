require "httpi"
require "curb"

module Xiami
  class HTTPClient
    module ClassMethods
      HTTPI.adapter = :curb

      def get_content(url)
        get(url).body
      end

      def get(url)
        request = prepare_request(url)

        HTTPI.get(request)
      end

      def post(url)
        request = prepare_request(url)
        request['User-Agent'] = user_agent

        HTTPI.post(request)
      end

      private

      def prepare_request(url)
        HTTPI::Request.new(url)
      end

      def user_agent
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/7.0.6 Safari/537.78.2"
      end
    end

    class << self; include ClassMethods; end
  end
end
