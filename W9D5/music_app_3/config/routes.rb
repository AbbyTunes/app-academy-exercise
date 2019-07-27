Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bands, only: [:index, :show, :create, :update, :destroy] do
    resources :albums, only: [:index]
  end

  resources :albums, only: [:create, :show, :update, :destroy] do
    resources :tracks, only: [:index]
  end

  resources :tracks, only: [:create, :show, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  # how to nest users and sessions 
end
