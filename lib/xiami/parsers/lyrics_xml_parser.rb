require "nokogiri"
require "cgi"

module Xiami
  module Parser
    class LyricsXMLParser
      module ClassMethods
        def parse(xml_content)
          new(xml_content).parse
        end
      end

      class << self
        include ClassMethods
      end

      def initialize(xml_content)
        @xml_content = xml_content
      end

      def parse
        doc  = Nokogiri::XML(@xml_content)

        doc.at_css('playlist trackList track lyric').content
      end
    end
  end
end
