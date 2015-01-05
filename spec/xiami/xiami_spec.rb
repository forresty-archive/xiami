require "spec_helper"

describe Xiami do
  describe 'module level methods' do
    subject { Xiami }
    it { should respond_to :fetch_large_album_art }
    it { should respond_to :fetch_large_album_art= }

    describe '.fetch_large_album_art' do
      it 'by default does not fetch large album art' do
        Xiami.fetch_large_album_art.should == false
      end

      it 'sets and gets' do
        Xiami.fetch_large_album_art = true
        Xiami.fetch_large_album_art.should == true
      end
    end
  end
end
