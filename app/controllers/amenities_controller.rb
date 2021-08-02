class AmenitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  def index
    render json: Amenity.all
  end

  def show
    amenity = find_amenity
    render json: amenity
  end

  private

  def find_amenity
    Amenity.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Amenity not found.' }, status: :not_found
  end
end
