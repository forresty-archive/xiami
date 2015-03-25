require_relative "http_client"
require_relative 'artist'
require_relative 'album'

module Xiami
  class Song
    include Virtus::Model

    attribute :id,            Integer
    attribute :name,          String
    attribute :temporary_url, String
    attribute :artist,        Artist
    attribute :album,         Album

    class << self
      def search(query)
        Searcher.search(query: query)
      end

      def fetch(song_url)
        song_id = song_url.match(/song\/([0-9]+)/)[1] rescue song_url

        fetch!(song_id) rescue nil
      end

      def fetch!(id)
        song = parse_xml_info!(id) rescue parse_html_page!(id)

        song.id = id

        song.fetch_all_album_arts!

        song
      end

      def parse_html_page!(id)
        html = HTTPClient.get_content("http://www.xiami.com/song/#{id}")

        Parser::HTMLParser.parse(html)
      end

      def parse_xml_info!(id)
        xml = HTTPClient.get_content("http://www.xiami.com/widget/xml-single/uid/0/sid/#{id}")

        Parser::XMLParser.parse(xml)
      end
    end

    def fetch_all_album_arts!
      results = CoverFetcher.fetch_all(album.cover_url, HTTPClient.proxy)

      album.cover_urls = results[:cover_urls]
      album.cover_url = results[:cover_url]
    end

    def ==(another)
      return false if another.nil?

      self.id == another.id
    end

    def title
      name
    end

    def artist_name
      artist.name
    end

    def album_name
      album.name
    end
  end
end
