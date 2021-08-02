# frozen_string_literal: true

class ListingsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_process

  def create
    listing = Listing.create!(listing_params)
    render json: listing, status: :created
  end

  def index
    render json: Listing.all
  end

  def update
    listing = find_listing
    listing.update!(listing_params)
  end

  def show
    listing = find_listing
    render json: listing
  end

  def destroy
    listing = find_listing
    listing.destroy
    head :no_content
  end

  private

  def listing_params
    params.permit(:start_date, :end_date, :price, :measurement, :user_id, :property_id)
  end

  def find_listing
    Listing.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Listing not found.' }, status: :not_found
  end

  def display_could_not_process(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
