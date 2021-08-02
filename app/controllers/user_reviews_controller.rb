class UserReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  def index
    render json: UserReview.all
  end

  def show
    user_review = find_user_review
    render json: user_review
  end

  private

  def find_user_review
    UserReview.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'User Review not found.' }, status: :not_found
  end
end
