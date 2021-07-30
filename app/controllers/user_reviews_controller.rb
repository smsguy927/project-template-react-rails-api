class UserReviewsController < ApplicationController
  def index
    render json: UserReview.all
  end
end
