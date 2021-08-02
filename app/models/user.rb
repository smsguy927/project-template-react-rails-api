class User < ApplicationRecord
  has_many :user_reviews
  has_many :property_reviews
  has_many :listings
  has_many :properties, through: :listings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true
end
