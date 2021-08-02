class Address < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, length: { is: 2 }
  validates :zip_code, format: { with: /\d{5}/, message: 'must be 5 digits' }
end
