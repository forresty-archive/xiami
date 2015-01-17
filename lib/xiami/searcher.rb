require "httparty"
require "nokogiri"

module Xiami
  class Searcher
    attr_reader :query

    def initialize(query)
      @query = query
    end

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
      user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/7.0.6 Safari/537.78.2"

      HTTParty.post("http://www.xiami.com/search?key=#{URI.encode(query)}&pos=1", headers: { "User-Agent" => user_agent }).body
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
