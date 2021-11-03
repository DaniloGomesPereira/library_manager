# frozen_string_literal: true

Rails.application.routes.draw do
  resources :authors, :publishers, :books, :genres, :magazines
end
