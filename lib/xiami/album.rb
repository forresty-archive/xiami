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
  end
end
