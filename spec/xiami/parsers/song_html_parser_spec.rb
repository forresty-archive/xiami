require "spec_helper"

module Xiami
  module Parser
    describe SongHTMLParser do
      subject { SongHTMLParser.new(data) }

      context 'when has trailing whitespace in song name' do
        let(:data) { fixture('songs/3351088', 'html') }

        it 'strips' do
          expect(subject.parse.name).to eq('西湖')
        end
      end

      context 'when has trailing whitespace in album name' do
        let(:data) { fixture('songs/3251066', 'html') }

        it 'strips' do
          expect(subject.parse.album.name).to eq('DANS MON ILE')
        end
      end
    end
  end
end
