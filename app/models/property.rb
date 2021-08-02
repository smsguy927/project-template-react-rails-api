class Property < ApplicationRecord
  has_many :listings
  has_many :users, through: :listings
  validates :name, presence: true
  validates :description, presence: true
  validates :num_bedrooms, numericality: { greater_than_or_equal_to: 0 }
  validates :num_bathrooms, numericality: { greater_than_or_equal_to: 0 }
  validates :address_id, presence: true
end
