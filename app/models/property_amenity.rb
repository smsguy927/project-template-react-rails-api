class PropertyAmenity < ApplicationRecord
  belongs_to :property
  belongs_to :amenity
  validates :property_id, presence: true
  validates :amenity_id, presence: true
end
