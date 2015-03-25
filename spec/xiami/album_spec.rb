require "spec_helper"

module Xiami
  describe Album do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :cover_urls }
    it { is_expected.to respond_to :songs }

    describe 'class methods' do
      subject { Album }

      it { is_expected.to respond_to :fetch }
      it { is_expected.to respond_to :fetch! }

      describe '.fetch!' do
        it 'fetches songs' do
          expect(Album.fetch!(56346).count).to eq(12)
        end
      end
    end
  end
end
