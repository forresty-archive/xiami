require "spec_helper"

module Xiami
  module Parser
    describe SongSearchHTMLParser do
      it 'parses' do
        expect(SongSearchHTMLParser.new(fixture('search/radiohead', 'html')).parse.size).to eq(12)
        expect(SongSearchHTMLParser.new(fixture('search/dido', 'html')).parse.size).to eq(19)
      end
    end
  end
end
