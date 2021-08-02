class UserReviewSerializer < ActiveModel::Serializer
  attributes :id, :general, :comment, :month, :year, :reviewed_by
end
