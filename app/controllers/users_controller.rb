# frozen_string_literal: true

class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :display_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :display_could_not_process

  def create
    user = User.create!(user_params)
    render json: user, status: :created
  end

  def update
    user = find_user
    user.update!(user_params)
  end

  def index
    render json: User.all
  end

  def show
    user = find_user
    render json: user
  end

  def destroy
    user = find_user
    user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :user_name, :password, :admin, :email, :phone_number)
  end

  def find_user
    User.find(params[:id])
  end

  def display_not_found_response
    render json: { error: 'User not found.' }, status: :not_found
  end

  def display_could_not_process(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
