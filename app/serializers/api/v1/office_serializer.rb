module Api
  module V1
    class OfficeSerializer < ActiveModel::Serializer
      BASE_ATTRIBUTES = %i[city name state street zip phone geolocation].freeze

      attributes :id, *BASE_ATTRIBUTES

      BASE_ATTRIBUTES.each do |attribute|
        define_method attribute do
          object.attributes[attribute]
        end
      end
    end
  end
end
