class ListingSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :price, :measurement
  has_one :user
  has_one :property
end
