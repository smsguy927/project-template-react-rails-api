# frozen_string_literal: true

class AmenitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_process

  def create
    amenity = Amenity.create!(amenity_params)
    render json: amenity, status: :created
  end

  def update
    amenity = find_amenity
    amenity.update!(amenity_params)
  end

  def index
    render json: Amenity.all
  end

  def show
    amenity = find_amenity
    render json: amenity
  end

  def destroy
    amenity = find_amenity
    amenity.destroy
    head :no_content
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

  def display_could_not_process(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
