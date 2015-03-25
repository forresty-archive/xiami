module Xiami
  class Album
    include Virtus::Model

    attribute :name,       String
    attribute :id,         Integer
    attribute :cover_url,  String
    attribute :cover_urls, Array[String]

    def initialize
      self.cover_urls = []
    end

    module ClassMethods
      def fetch(album_id)
        fetch!(album_id) rescue nil
      end

      def fetch!(album_id)

      end
    end

    class << self; include ClassMethods; end
  end
end
