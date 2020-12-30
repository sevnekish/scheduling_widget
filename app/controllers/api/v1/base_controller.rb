module Api
  module V1
    class BaseController < ActionController::API
      def render_error(message, status)
        render json: { error: message }, status: status
      end

      def handle_response(response)
        if response.errors.any?
          render json: { error: response.errors.join('; ') }, status: :bad_request
        else
          render json: ActiveModel::Serializer::CollectionSerializer.new(response.data,serializer: serializer).to_json,
                 status: :ok
        end
      end
    end
  end
end
