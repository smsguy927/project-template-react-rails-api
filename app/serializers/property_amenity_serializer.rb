# frozen_string_literal: true

class PropertyAmenitySerializer < ActiveModel::Serializer
  attributes :id
  has_one :property
  has_one :amenity
end
