require "virtus"
require "inflecto"

module Xiami
  module Service
    class Base
      include Virtus::Model

      module ClassMethods
        def call(*args)
          new(*args).call
        end
      end

      class << self; include ClassMethods; end
    end
  end
end
