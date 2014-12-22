Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:show, :index, :edit, :update] do
    resources :histories, only: [:index, :new, :create]
  end
end
