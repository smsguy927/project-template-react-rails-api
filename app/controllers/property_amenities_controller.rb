# frozen_string_literal: true

class PropertyAmenitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_process

  def create
    property_amenity = PropertyAmenity.create!(property_amenity_params)
    render json: property_amenity, status: :created
  end

  def update
    property_amenity = find_property_amenity
    property_amenity.update!(property_amenity_params)
  end

  def index
    render json: PropertyAmenity.all
  end

  def show
    property_amenity = find_property_amenity
    render json: property_amenity
  end

  def destroy
    property_amenity = find_property_amenity
    property_amenity.destroy
    head :no_content
  end

  private

  def property_amenity_params
    params.permit(:property_id, :amenity_id)
  end

  def find_property_amenity
    PropertyAmenity.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Property Amenity not found.' }, status: :not_found
  end

  def display_could_not_process(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
