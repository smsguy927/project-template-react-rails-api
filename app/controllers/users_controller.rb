# frozen_string_literal: true

class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  def index
    render json: User.all
  end

  def show
    user = find_user
    render json: user
  end

  private

  def find_user
    User.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'User not found.' }, status: :not_found
  end
end
