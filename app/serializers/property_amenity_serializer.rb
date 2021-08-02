class PropertyAmenitySerializer < ActiveModel::Serializer
  attributes :id
  has_one :property
  has_one :amenity
end
