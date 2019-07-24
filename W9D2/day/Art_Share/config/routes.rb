Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 


  
  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'
  # get 'users', to: 'users#new', as: 'new_user'
  # get 'users/:id', to: 'users#show', as: 'show'
  # get 'users/:id', to: 'users#edit', as: 'edit_user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#distroy'


  resources :users, only: [:index, :show, :create,:destroy]# :update, :destroy
  resources :artwork_shares, only: [:index, :show, :create,:destroy]# :update, :destroy
  resources :users, only: [:index, :show, :create,:destroy]# :update, :destroy
end