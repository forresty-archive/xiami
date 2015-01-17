require "nokogiri"

module Xiami
  module Parser
    class HTMLParser
      def parse(html_content)
        song = Song.new.tap do |song|
          doc = Nokogiri::HTML(html_content)

          song.name = doc.at_css('#title h1').content

          song.album = Album.new.tap do |album|
            album.id = doc.at_css('#albumCover')['href'].match(/album\/(\d+)/)[1].to_i
            album.name = doc.at_css('#albumCover')['title']
            album.cover_url = doc.at_css('.cdCDcover185')['src']
          end

          song.artist = Artist.new.tap do |artist|
            artist_node = doc.at_css('#albums_info').css('a').select { |a| a['href'] =~ /^\/artist\/(\d+)/ }.first
            if artist_node
              artist.id = artist_node['href'].match(/^\/artist\/(\d+)/)[1].to_i rescue nil
              artist.name = artist_node.content rescue nil
            else
              artist_node = doc.at_css('#albums_info').css('a').select { |a| a['href'] =~ /search/ }.first
              artist.name = artist_node.content rescue nil
            end
          end

          song.temporary_url = nil
        end
      end

      module ClassMethods
        def parse(html_content)
          new.parse(html_content)
        end
      end

      class << self
        include ClassMethods
      end
    end
  end
end
