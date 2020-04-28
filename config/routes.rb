# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tickets, only: %i(index show)
end
