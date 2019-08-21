Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: redirect('/bands')
  
  resources :users, only: [:new, :create, :show] # added :show

  resource :session, only: [:new, :create, :destroy] 
  # login, current_user, logout
  
  # Collection Routes
  resources :bands do

    # Collection Routes
    resources :albums, only: [:index, :new] 
    # only :new 
    # no :index, no :create 
  end

  # Member Routes
  resources :albums, only: [:create, :edit, :show, :update, :destroy] do # added :create

    # Collection Routes
    resources :tracks, only: [:index, :new]
    # only :new 
    # no :index, no :create 
  end

  # Member Routes
  resources :tracks, only: [:create, :edit, :show, :update, :destroy] # added :create

end
