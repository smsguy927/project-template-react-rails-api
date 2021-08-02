class PropertiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  def index
    render json: Property.all
  end

  def show
    property = find_property
    render json: property
  end

  private

  def find_property
    Property.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Property not found.' }, status: :not_found
  end
end
