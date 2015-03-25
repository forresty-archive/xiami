require "spec_helper"

module Xiami
  module Parser
    describe AlbumHTMLParser do
      it 'parses' do
        expect(AlbumHTMLParser.new(fixture('albums/56346', 'html')).parse.size).to eq(12)
      end

      it 'parses' do
        expect(AlbumHTMLParser.new(fixture('albums/4424', 'html')).parse.size).to eq(11)
      end
    end
  end
end
