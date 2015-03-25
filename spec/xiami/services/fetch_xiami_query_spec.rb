require "spec_helper"

module Xiami
  module Service
    describe FetchXiamiQuery do
      context 'when query is "Dark Water & Stars"' do
        it 'encodes URL right' do
          service = FetchXiamiQuery.new(query: "Dark Water & Stars")

          expect(service.send(:url)).to eq('http://www.xiami.com/search?key=Dark+Water+%26+Stars&pos=1')
        end
      end
    end
  end
end
