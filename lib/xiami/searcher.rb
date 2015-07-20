require "nokogiri"
require_relative "http_client"
require 'virtus'

module Xiami
  class Searcher
    include Virtus::Model

    attribute :query, String

    def search
      Xiami::Parser::SongSearchHTMLParser.parse html_content
    end

    def html_content
      Xiami::Service::FetchXiamiQuery.call(query: query)
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
