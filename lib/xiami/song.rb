require "httparty"

module Xiami
  class Song
    attr_accessor :id, :name, :temporary_url
    attr_accessor :artist, :album

    attr_accessor :local_file_path

    class << self
      def search(query)
        Searcher.search(query)
      end

      def fetch(song_url)
        song_id = song_url.match(/song\/([0-9]+)/)[1] rescue song_url

        fetch!(song_id)

      end

      def fetch!(id)
        song = parse_xml_info!(id) rescue parse_html_page!(id)

        song.id = id

        song.fetch_all_album_arts!

        song
      end

      def parse_html_page!(id)
        html = HTTParty.get("http://www.xiami.com/song/#{id}").body

        Parser::HTMLParser.parse(html)
      end

      def parse_xml_info!(id)
        xml = HTTParty.get("http://www.xiami.com/widget/xml-single/uid/0/sid/#{id}").body

        Parser::XMLParser.parse(xml)
      end
    end

    def fetch_all_album_arts!
      results = CoverFetcher.fetch_all(album.cover_url)

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
