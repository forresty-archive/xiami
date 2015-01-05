require "xiami/version"
require "xiami/song"
require "xiami/album"
require "xiami/artist"

module Xiami
  class << self
    def fetch_large_album_art=(should_fetch)
      instance_variable_set("@fetch_large_album_art", should_fetch)
    end

    def fetch_large_album_art
      instance_variable_get("@fetch_large_album_art") || false
    end
  end
end
