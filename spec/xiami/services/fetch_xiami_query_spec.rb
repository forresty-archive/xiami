require "spec_helper"

module Xiami
  module Service
    describe FetchXiamiQuery do
      context 'when query is "Dark Water & Stars"' do
        it 'encodes URL right' do
          service = FetchXiamiQuery.new(query: "Dark Water & Stars")
          service.instance_eval do
            url.should == 'http://www.xiami.com/search?key=Dark+Water+%26+Stars&pos=1'
          end
        end
      end
    end
  end
end
