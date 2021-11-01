# frozen_string_literal: true

Rails.application.routes.draw do
  get 'magazines/index'
  get 'magazines/show'
  get 'magazines/create'
  get 'magazines/update'
  get 'magazines/destroy'
  resources :authors, :publishers, :books, :genres, :magazines
end
