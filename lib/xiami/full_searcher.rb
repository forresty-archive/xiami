require "nokogiri"
require_relative "http_client"
require 'virtus'

module Xiami
  class FullSearcher
    include Virtus::Model

    attribute :query, String

    def search
      parser_class = Xiami::Parsers::SongSearchHTMLParser
      pages.map {|content| parser_class.parse content}.flatten
    end

    def pages
      Xiami::Service::FetchXiamiSongSearch.call(query: query)
    end

    module ClassMethods
      def search(query)
        new(query).search
      rescue
        []
      end
    end

    class << self
      include ClassMethods
    end
  end
end
