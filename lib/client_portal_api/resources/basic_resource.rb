module ClientPortalApi
  module Resources
    class BasicResource
      class_attribute :endpoint

      class << self
        def all(options = {})
          Request.new(
            endpoint: endpoint,
            method: :get,
            query_params: options[:query_params]
          ).call
        end
      end
    end
  end
end
