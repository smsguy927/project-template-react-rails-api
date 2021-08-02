# frozen_string_literal: true

class AmenitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_create

  def create
    amenity = Amenity.create!(amenity_params)
    render json: amenity, status: :created
  end

  def index
    render json: Amenity.all
  end

  def show
    amenity = find_amenity
    render json: amenity
  end

  private

  def amenity_params
    params.permit(:name)
  end

  def find_amenity
    Amenity.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Amenity not found.' }, status: :not_found
  end

  def display_could_not_create(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
