require "spec_helper"

module Xiami
  describe Artist do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :id }
  end
end
