class User < ApplicationRecord
  has_many :user_reviews
  has_many :property_reviews
  has_many :listings
  has_many :properties, through: :listings
end
