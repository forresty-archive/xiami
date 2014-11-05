require "spec_helper"

module Xiami
  describe Album do
    it { should respond_to :name }
    it { should respond_to :id }
  end
end
