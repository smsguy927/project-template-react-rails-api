# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :user_name, :password, :admin, :email, :phone_number
  has_many :properties
  has_many :addresses
end
