# frozen_string_literal: true

class UserReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_process

  def create
    user_review = UserReview.create!(user_review_params)
    render json: user_review, status: :created
  end

  def update
    user_review = find_user_review
    user_review.update!(user_review_params)
  end

  def index
    render json: UserReview.all
  end

  def show
    user_review = find_user_review
    render json: user_review
  end

  def destroy
    user_review = find_user_review
    user_review.destroy
    head :no_content
  end

  private

  def user_review_params
    params.permit(:general, :comment, :month, :year, :reviewed_by, :user_id)
  end

  def find_user_review
    UserReview.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'User Review not found.' }, status: :not_found
  end

  def display_could_not_process(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
