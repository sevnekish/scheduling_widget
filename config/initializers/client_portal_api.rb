ClientPortalApi.configure do |config|
  config.api_url = ENV.fetch('CLIENT_PORTAL_API_URL', '')
end
