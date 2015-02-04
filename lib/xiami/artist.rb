module Xiami
  class Artist
    include Virtus::Model

    attribute :id,   Integer
    attribute :name, String
  end
end
