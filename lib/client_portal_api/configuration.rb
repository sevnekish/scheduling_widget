module ClientPortalApi
  class Configuration
    DEFAULT_API_URL = 'https://default_portal_url'.freeze

    DEFAULT_HEADERS = {
      'Accept': 'application/vnd.api+json',
      'Api-Version': '2019-01-17',
      'Application-Build-Version': '0.0.0',
      'Application-Platform': 'web'
    }.freeze

    attr_accessor :api_url, :headers

    def initialize
      @api_url = DEFAULT_API_URL
      @headers = DEFAULT_HEADERS
    end
  end
end
