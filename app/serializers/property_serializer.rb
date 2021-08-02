# frozen_string_literal: true

class PropertySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :num_bedrooms, :num_bathrooms, :address_id
  has_many :amenities
  has_many :property_reviews
end
