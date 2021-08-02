# frozen_string_literal: true

class PropertyReviewSerializer < ActiveModel::Serializer
  attributes :id, :cleanliness, :accuracy, :communication, :location, :value, :comment, :month, :year
  has_one :user
  has_one :property
end
