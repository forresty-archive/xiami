require "spec_helper"

module Xiami
  module Service
    describe FetchXiamiSongSearch do
      context 'when query is "Dark Water & Stars"' do
        it 'encodes URL right' do
          service = FetchXiamiSongSearch.new(query: "Dark Water & Stars")

          expect(service.send(:url, 1)).to eq('http://www.xiami.com/search/song/page/1?key=Dark+Water+%26+Stars')
        end
      end
    end
  end
end
