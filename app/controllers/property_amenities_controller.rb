# frozen_string_literal: true

class PropertyAmenitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  def index
    render json: PropertyAmenity.all
  end

  def show
    property_amenity = find_property_amenity
    render json: property_amenity
  end

  private

  def find_property_amenity
    PropertyAmenity.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Property Amenity not found.' }, status: :not_found
  end
end
