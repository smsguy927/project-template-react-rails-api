class AddressesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  def index
    render json: Address.all
  end

  def show
    address = find_address
    render json: address
  end

  private

  def find_address
    Address.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Address not found.' }, status: :not_found
  end
end
