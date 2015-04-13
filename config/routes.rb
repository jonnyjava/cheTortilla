CheTortilla::Application.routes.draw do

  devise_for :users

  resources :users
  resources :dishes
  resources :participations
  resources :events do
    resources :invitations, except:[:edit, :update]
  end

  root to: 'home#index'

  get 'invitations/token_verification/:token', to: 'invitations#token_verification', as: 'token_verification'
  get 'invitations/user_invitations/:user', to: 'invitations#user_invitations', as: 'user_invitations'
end
