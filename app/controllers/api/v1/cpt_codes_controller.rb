module Api
  module V1
    class CptCodesController < BaseController
      def index
        response = ClientPortalApi::Resources::CptCode.all(
          query_params: {
            filter: {
              clinician_id: Rails.configuration.x.default_clinician_id
            }
          }
        )

        handle_response(response)
      end

      private

      def serializer
        Api::V1::CptCodeSerializer
      end
    end
  end
end
