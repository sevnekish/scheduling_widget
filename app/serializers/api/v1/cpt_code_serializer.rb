module Api
  module V1
    class CptCodeSerializer < ActiveModel::Serializer
      BASE_ATTRIBUTES = %i[description duration rate].freeze

      attributes :id, *BASE_ATTRIBUTES

      BASE_ATTRIBUTES.each do |attribute|
        define_method attribute do
          object.attributes[attribute]
        end
      end
    end
  end
end
