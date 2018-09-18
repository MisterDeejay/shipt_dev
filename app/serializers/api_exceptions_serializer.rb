class ApiExceptionsSerializer < ActiveModel::Serializer
  attributes :status, :detail
end
