require "httparty"

module Xiami
  class HTTPClient
    module ClassMethods
      def get_content(url)
        get(url).body
      end

      def get(url)
        HTTParty.get(url)
      end

      def post(url)
        HTTParty.post(url, headers: { "User-Agent" => user_agent })
      end

      private

      def user_agent
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/7.0.6 Safari/537.78.2"
      end
    end

    class << self; include ClassMethods; end
  end
end
