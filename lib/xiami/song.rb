# originally from xiami_sauce gem
require "httpclient"
require "cgi"
require 'nokogiri'
require 'fastimage'

module Xiami
  class Song
    attr_accessor :id, :name, :temporary_url
    attr_accessor :artist, :album

    attr_accessor :local_file_path

    class << self
      def fetch(song_url = nil)
        new(song_url)
      rescue
        nil
      end
    end

    def initialize(song_url = nil)
      if song_url
        @id = song_url.match(/song\/([0-9]+)/)[1] rescue song_url

        parse_xml_info! rescue parse_html_page!
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

    def parse_xml_info!
      doc  = Nokogiri::XML(info_xml)

      @id = doc.at_css('track song_id').content.to_i
      @name = CGI.unescapeHTML(doc.at_css('track song_name').content)

      @album = Album.new.tap do |album|
        album.id = doc.at_css('track album_id').content.to_i
        album.name = CGI.unescapeHTML(doc.at_css('track album_name').content)

        album.cover_url = doc.at_css('track album_cover').content
      end
      fetch_all_album_arts!

      @artist = Artist.new.tap do |artist|
        artist.id = doc.at_css('track artist_id').content.to_i
        artist.name = CGI.unescapeHTML(doc.at_css('track artist_name').content)
      end

      @temporary_url = sospa(doc.at_css('track location').content)
    end

    def parse_html_page!
      doc = Nokogiri::HTML(html_page)

      @name = doc.at_css('#title h1').content

      @album = Album.new.tap do |album|
        album.id = doc.at_css('#albumCover')['href'].match(/album\/(\d+)/)[1].to_i
        album.name = doc.at_css('#albumCover')['title']
        album.cover_url = doc.at_css('.cdCDcover185')['src']
      end

      fetch_all_album_arts!

      @artist = Artist.new.tap do |artist|
        artist_node = doc.at_css('#albums_info').css('a').select { |a| a['href'] =~ /^\/artist\/(\d+)/ }.first
        if artist_node
          artist.id = artist_node['href'].match(/^\/artist\/(\d+)/)[1].to_i rescue nil
          artist.name = artist_node.content rescue nil
        else
          artist_node = doc.at_css('#albums_info').css('a').select { |a| a['href'] =~ /search/ }.first
          artist.name = artist_node.content rescue nil
        end
      end

      @temporary_url = nil
    end

    private

    def fetch_all_album_arts!
      (1..5).each do |i|
        current_album_art = album.cover_url.gsub(/(\d\.jpg)$/, "#{i}.jpg")

        if size = FastImage.size(current_album_art)
          album.cover_urls << { url: current_album_art, size: size }
        end
      end

      album.cover_url = album.cover_urls.max { |a, b| a[:size] <=> b[:size] }[:url]
    end

    def html_page
      HTTPClient.new.get("http://www.xiami.com/song/#{id}").body
    end

    def info_xml
      HTTPClient.new.get("http://www.xiami.com/widget/xml-single/uid/0/sid/#{id}").body
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
