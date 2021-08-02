# frozen_string_literal: true

class ListingsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  def index
    render json: Listing.all
  end

  def show
    listing = find_listing
    render json: listing
  end

  private

  def find_listing
    Listing.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Listing not found.' }, status: :not_found
  end
end
