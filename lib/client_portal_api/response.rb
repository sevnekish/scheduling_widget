module ClientPortalApi
  class Response
    attr_reader :body

    def initialize(json_body)
      @body = JSON.parse(json_body)
    end

    def errors
      @errors ||= body['errors'].present? ? body['errors'].pluck('title') : []
    end

    def data
      @data ||= body['data'].present? ? JA2R.parse(body) : nil
    end
  end
end
