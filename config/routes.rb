CheTortilla::Application.routes.draw do

  devise_for :users

  resources :users
  resources :dishes
  resources :participations
  resources :events do
    resources :invitations, except:[:edit, :update]
  end

  root to: 'home#index'

  get 'invitations/accept_invitation/:token', to: 'invitations#accept_invitation', as: 'accept_invitation'
  get 'invitations/reject_invitation/:token', to: 'invitations#reject_invitation', as: 'reject_invitation'
  get 'invitations/user_invitations/:user', to: 'invitations#user_invitations', as: 'user_invitations'
end
