# frozen_string_literal: true

class AddressesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_create

  def create
    address = Address.create!(address_params)
    render json: address, status: :created
  end

  def index
    render json: Address.all
  end

  def show
    address = find_address
    render json: address
  end

  private

  def address_params
    params.permit(:user_id, :street, :city, :state, :zip_code)
  end

  def find_address
    Address.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'Address not found.' }, status: :not_found
  end

  def display_could_not_create(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
