class ListingsController < ApplicationController
  def index
    render json: Listing.all
  end
end
