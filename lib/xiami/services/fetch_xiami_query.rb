require_relative "base"
require "httparty"

module Xiami
  module Service
    class FetchXiamiQuery < Base
      attribute :query, String

      def call
        HTTParty.post(url, headers: { "User-Agent" => user_agent }).body
      end

      private

      def url
        "http://www.xiami.com/search?key=#{URI.encode(query)}&pos=1"
      end

      def user_agent
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/7.0.6 Safari/537.78.2"
      end
    end
  end
end
