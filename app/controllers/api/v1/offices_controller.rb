module Api
  module V1
    class OfficesController < BaseController
      def index
        response = ClientPortalApi::Resources::Office.all(
          query_params: {
            filter: {
              clinician_id: Rails.configuration.x.default_clinician_id,
              cpt_code_id: cpt_code_id
            }
          }
        )

        handle_response(response)
      end

      private

      def cpt_code_id
        params.require(:cpt_code_id)
      end

      def serializer
        Api::V1::OfficeSerializer
      end
    end
  end
end
