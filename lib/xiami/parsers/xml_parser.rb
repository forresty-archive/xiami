require "nokogiri"
require "cgi"

module Xiami
  module Parser
    class XMLParser
      module ClassMethods
        def parse(xml_content)
          new.parse(xml_content)
        end
      end

      class << self
        include ClassMethods
      end

      def parse(xml_content)
        song = Song.new.tap do |song|
          doc  = Nokogiri::XML(xml_content)

          song.id = doc.at_css('track song_id').content.to_i
          song.name = CGI.unescapeHTML(doc.at_css('track song_name').content)

          song.album = Album.new.tap do |album|
            album.id = doc.at_css('track album_id').content.to_i
            album.name = CGI.unescapeHTML(doc.at_css('track album_name').content)

            album.cover_url = doc.at_css('track album_cover').content
          end

          song.artist = Artist.new.tap do |artist|
            artist.id = doc.at_css('track artist_id').content.to_i
            artist.name = CGI.unescapeHTML(doc.at_css('track artist_name').content)
          end

          song.temporary_url = sospa(doc.at_css('track location').content)
        end
      end

      def sospa(location)
        string    = location[1..-1]
        col       = location[0].to_i
        row       = (string.length.to_f / col).floor
        remainder = string.length % col
        address   = [[nil] * col] * (row + 1)

        sizes = [row+1] * remainder + [row] * (col - remainder)
        pos = 0
        sizes.each_with_index do |size, i|
          size.times { |index| address[col * index + i] = string[pos + index] }
          pos += size
        end

        address = CGI::unescape(address.join).gsub('^', '0')
      rescue
        raise location
      end
    end
  end
end
