module Xiami
  class Album
    attr_accessor :name, :id, :cover_url, :cover_urls

    def initialize
      @cover_urls = []
    end
  end
end
