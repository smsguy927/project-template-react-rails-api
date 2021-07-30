class PropertyReviewsController < ApplicationController
  def index
    render json: PropertyReview.all
  end
end
