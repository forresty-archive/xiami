require "spec_helper"

module Xiami
  module Parser
    describe AlbumHTMLParser do
      subject { AlbumHTMLParser.new(fixture('albums/56346', 'html')) }

      it 'parses' do
        expect(subject.parse.size).to eq(12)
      end
    end
  end
end
