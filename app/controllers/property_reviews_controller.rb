class PropertyReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  def index
    render json: PropertyReview.all
  end

  def show
    property_review = find_property_review
    render json: property_review
  end

  private

  def find_property_review
    PropertyReview.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Property Review not found.' }, status: :not_found
  end
end
