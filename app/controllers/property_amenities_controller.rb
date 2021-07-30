class PropertyAmenitiesController < ApplicationController
  def index
    render json: PropertyAmenity.all
  end
end
