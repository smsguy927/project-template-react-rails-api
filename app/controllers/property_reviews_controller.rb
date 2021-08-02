# frozen_string_literal: true

class PropertyReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_create

  def create
    property_review = PropertyReview.create!(property_review_params)
    render json: property_review, status: :created
  end

  def index
    render json: PropertyReview.all
  end

  def show
    property_review = find_property_review
    render json: property_review
  end

  private

  def property_review_params
    params.permit(:cleanliness, :accuracy, :communication, :location, :value, :comment, :month, :year, :user_id, :property_id)
  end

  def find_property_review
    PropertyReview.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Property Review not found.' }, status: :not_found
  end

  def display_could_not_create(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
