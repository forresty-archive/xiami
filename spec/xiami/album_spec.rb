require "spec_helper"

module Xiami
  describe Album do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :cover_urls }

    describe 'class methods' do
      subject { Album }
      it { is_expected.to respond_to :fetch }
      it { is_expected.to respond_to :fetch! }
    end
  end
end
