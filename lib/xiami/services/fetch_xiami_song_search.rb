require_relative "base"
require_relative "../http_client"

module Xiami
  module Service
    class FetchXiamiSongSearch < Base
      # Only first 4 pages can be viewed without login.
      AVAILABLE_PAGES = 4

      attribute :query, String
      attribute :pages, Integer, :default => AVAILABLE_PAGES

      def call
        (1..pages).map { |p| HTTPClient.get(url(p)).body }
      end

      private

      def url(page)
        "http://www.xiami.com/search/song/page/#{page}?key=#{CGI.escape(query)}"
      end
    end
  end
end
