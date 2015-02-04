require "nokogiri"
require_relative "http_client"
require 'virtus'

module Xiami
  class Searcher
    include Virtus::Model

    attribute :query, String

    def search
      result = []

      doc = Nokogiri::HTML(html_content)

      doc.at_css('table.track_list').css('td.chkbox').each do |checkbox|
        tr = checkbox.parent

        next if tr.parent['class'] == 'same_song_group'

        title = tr.at_css('td.song_name').css('a').find { |a| a['target'] == '_blank' }['title']
        artist = tr.at_css('td.song_artist a').text.strip
        album = tr.at_css('td.song_album a').text
        id = checkbox.at_css('input')['value'].to_i

        result << { id: id, title: title, artist: artist, album: album }
      end

      result
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
