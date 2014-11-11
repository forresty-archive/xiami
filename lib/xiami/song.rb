# originally from xiami_sauce gem
require "cgi"
require 'net/http'
require 'nokogiri'

module Xiami
  class Song
    attr_accessor :id, :name, :temporary_url
    attr_accessor :artist, :album

    attr_accessor :local_file_path

    def initialize(song_url = nil)
      if song_url
        @id = song_url.match(/song\/([0-9]+)/)[1] rescue song_url

        parse_info!
      end
    end

    def ==(another)
      return false if another.nil?

      self.id == another.id
    end

    def title
      name
    end

    def artist_name
      artist.name
    end

    def album_name
      album.name
    end

    def parse_info!
      doc  = Nokogiri::XML(info_xml)

      @id = doc.at_css('track song_id').content
      @name = CGI.unescapeHTML(doc.at_css('track song_name').content)

      @album = Album.new.tap do |album|
        album.id = doc.at_css('track album_id').content
        album.name = CGI.unescapeHTML(doc.at_css('track album_name').content)
        album.cover_url = doc.at_css('track album_cover').content
      end

      @artist = Artist.new.tap do |artist|
        artist.id = doc.at_css('track artist_id').content
        artist.name = CGI.unescapeHTML(doc.at_css('track artist_name').content)
      end

      @temporary_url = sospa(doc.at_css('track location').content)
    end

    private

    def info_xml
      uri  = URI.parse("http://www.xiami.com/widget/xml-single/uid/0/sid/#{id}")

      headers = { 'accept' => 'text/html', 'user-agent' => 'Mozilla/5.0' }

      Net::HTTP.new(uri.host, uri.port).get2(uri.path, headers).body
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
