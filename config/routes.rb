CheTortilla::Application.routes.draw do
  devise_for :users
  resources :dishes

  resources :participations

  resources :events

  resources :users

  root to: 'users#index'
end
