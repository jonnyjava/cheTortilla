CheTortilla::Application.routes.draw do

  devise_for :users

  resources :users
  resources :dishes
  resources :participations
  resources :events do
    resources :invitations, except:[:edit, :update]
  end

  root to: 'home#index'

  post 'invitations/accepted/:token', to: 'invitations#accepted', as: 'accepted'
  post 'invitations/reject_invitation/:token', to: 'invitations#reject_invitation', as: 'reject_invitation'
  get 'invitations/user_invitations/:user', to: 'invitations#user_invitations', as: 'user_invitations'
end
