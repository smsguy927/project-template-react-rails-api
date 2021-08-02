class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :general, inclusion: 0.5..5
  validates :month, inclusion: 1..12
  validates :year, numericality: { greater_than_or_equal_to: 2021 }
  validates :user_id, presence: true
  validates :property_id, presence: true
  validates :reviewed_by, presence: true
end
