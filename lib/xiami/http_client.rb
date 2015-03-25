require "httpi"
require "curb"

module Xiami
  class HTTPClient
    module ClassMethods
      HTTPI.adapter = :curb

      def proxy=(proxy_url)
        @proxy_url = proxy_url
      end

      def proxy
        @proxy_url
      end

      def get_content(url)
        content = get(url).body

        if match = content.match(%r{<script>document.cookie="sec=([^;]+)})
          content = get(url, 'Cookie' => "sec=#{match[1]}").body
        end

        content
      end

      def get(url, options={})
        request = prepare_request(url, options)
        request.headers['User-Agent'] = user_agent

        HTTPI.get(request)
      end

      def post(url)
        request = prepare_request(url)
        request.headers['User-Agent'] = user_agent

        HTTPI.post(request)
      end

      private

      def prepare_request(url, options={})
        request = HTTPI::Request.new(url)

        options.each do |key, value|
          request.headers[key] = value
        end

        request.proxy = @proxy_url if @proxy_url && @proxy_url.length > 0

        request
      end

      def user_agent
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/7.0.6 Safari/537.78.2"
      end
    end

    class << self; include ClassMethods; end
  end
end
