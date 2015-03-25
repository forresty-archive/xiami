module Xiami
  class Album
    include Virtus.model(finalize: false)

    attribute :name,       String
    attribute :id,         Integer
    attribute :cover_url,  String
    attribute :cover_urls, Array[String]
    attribute :songs,      Array['Xiami::Song']

    def initialize
      self.cover_urls = []
    end

    module ClassMethods
      def fetch(album_id)
        fetch!(album_id) rescue nil
      end

      def fetch!(album_id)
        html = HTTPClient.get_content("http://www.xiami.com/album/#{album_id}")

        Parser::AlbumHTMLParser.parse(html)
      end
    end

    class << self; include ClassMethods; end
  end
end
