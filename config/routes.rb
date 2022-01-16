# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all
  namespace :v1, defaults: { format: :json } do
    resources :authors, :publishers, :books, :genres, :magazines
    resources :sessions, only: %i[create destroy]

    devise_scope :user do
      post "sign_up", to: "registrations#create"
      post "sign_in", to: "sessions#create"
    end
  end
end
