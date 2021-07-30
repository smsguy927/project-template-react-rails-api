class AmenitiesController < ApplicationController
  def index
    render json: Amenity.all
  end
end
