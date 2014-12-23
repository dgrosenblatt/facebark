Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:show, :index, :edit, :update] do
    resources :histories,   only: [:index, :new, :create]
    resources :requests,    only: [:index]
    resources :friendships, only: [:create]
  end
end
