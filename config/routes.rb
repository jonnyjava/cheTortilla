CheTortilla::Application.routes.draw do

  devise_for :users
  resources :dishes

  resources :participations

  resources :events do
    resources :invitations, except:[:edit, :update]
  end

  resources :users

  root to: 'home#index'
end
