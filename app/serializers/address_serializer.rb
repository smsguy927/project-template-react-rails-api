class AddressSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :street, :city, :state, :zip_code
end
