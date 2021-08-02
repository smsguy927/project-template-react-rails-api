# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :user_id, presence: true
  validates :property_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :measurement, inclusion: { in: %w[night week month], message: '%<value> is not a valid unit' }
end
