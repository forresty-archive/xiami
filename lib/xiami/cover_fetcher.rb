require 'fastimage'

module Xiami
  class CoverFetcher
    def initialize(base_url, proxy_url)
      @base_url = base_url
      @proxy_url = proxy_url
    end

    def fetch_all
      cover_urls = (1..5).map do |i|
        current_album_art = @base_url.gsub(/(\d\.jpg)$/, "#{i}.jpg")

        if size = FastImage.size(current_album_art, proxy: @proxy_url)
          { url: current_album_art, size: size }
        end
      end.compact

      { cover_urls: cover_urls, cover_url: cover_urls.max { |a, b| a[:size] <=> b[:size] }[:url] }
    end

    module ClassMethods
      def fetch_all(base_url, proxy_url=nil)
        new(base_url, proxy_url).fetch_all
      end
    end

    class << self
      include ClassMethods
    end
  end
end
