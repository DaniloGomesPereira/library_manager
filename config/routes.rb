Rails.application.routes.draw do
  resources :authors, :publishers, :books, :genres
end