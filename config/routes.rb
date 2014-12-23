Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:show, :index, :edit, :update] do
    resources :histories,   only: [:index, :new, :create]
    resources :requests,    only: [:index]
    resources :friendships, only: [:create]
  end
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
