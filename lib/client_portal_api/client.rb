module ClientPortalApi
  class Client
    include Singleton

    attr_reader :client

    def initialize
      @client = Faraday.new(
        url: config.api_url,
        headers: config.headers
      ) do |config|
        config.adapter(Faraday.default_adapter)
      end
    end

    private

    def config
      ClientPortalApi.configuration
    end
  end
end
