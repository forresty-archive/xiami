require_relative "base"
require_relative "../http_client"

module Xiami
  module Service
    class FetchXiamiQuery < Base
      attribute :query, String

      def call
        HTTPClient.post(url).body
      end

      private

      def url
        "http://www.xiami.com/search?key=#{CGI.escape(query)}&pos=1"
      end
    end
  end
end
