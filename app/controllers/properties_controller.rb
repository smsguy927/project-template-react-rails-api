class PropertiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_process

  def create
    property = Property.create!(property_params)
    render json: property, status: :created
  end

  def update
    property = find_property
    property.update!(property_params)
  end

  def index
    render json: Property.all
  end

  def show
    property = find_property
    render json: property
  end

  private

  def property_params
    params.permit(:name, :description, :num_bedrooms, :num_bathrooms, :address_id)
  end

  def find_property
    Property.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Property not found.' }, status: :not_found
  end

  def display_could_not_process(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
