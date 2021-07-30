# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show create update destroy]
  resources :property_amenities, only: %i[index show create update destroy]
  resources :amenities, only: %i[index show create update destroy]
  resources :addresses, only: %i[index show create update destroy]
  resources :property_reviews, only: %i[index show create update destroy]
  resources :user_reviews, only: %i[index show create update destroy]
  resources :listings, only: %i[index show create update destroy]
  resources :properties, only: %i[index show create update destroy]
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get '*path', to: 'fallback#index', constraints: ->(req) { !req.xhr? && req.format.html? }
end
