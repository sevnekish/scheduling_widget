module ClientPortalApi
  class Request
    attr_reader :endpoint, :method, :query_params, :body

    def initialize(endpoint:, method:, query_params: nil, body: nil)
      @endpoint = endpoint
      @method = method
      @query_params = query_params
      @body = body
    end

    def call
      response = Client.instance.client.public_send(method, request_path) do |request|
        request.body = body
      end

      Response.new(response.body)
    end

    private

    def request_path
      path = endpoint
      path += "?#{prepare_query_params}" if query_params.present?
      path
    end

    def prepare_query_params
      query_params
        .deep_transform_keys! { |key| key.to_s.camelize(:lower) }
        .to_query
    end
  end
end
