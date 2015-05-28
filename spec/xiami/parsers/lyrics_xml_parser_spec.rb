require "spec_helper"

module Xiami
  module Parser
    describe LyricsXMLParser do
      subject { LyricsXMLParser.new(data) }

      context 'parses lyric url' do
        let(:data) { fixture('lyrics/1769706099', 'xml') }

        it 'strips' do
          expect(subject.parse).to eq('http://img.xiami.net/lyric/99/1769706099_14004036104281.lrc')
        end
      end
    end
  end
end
