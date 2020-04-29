# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tickets, only: %i(index show)

  namespace :api do
    namespace :v1 do
      resources :tickets, only: %i(create)
    end
  end
end
