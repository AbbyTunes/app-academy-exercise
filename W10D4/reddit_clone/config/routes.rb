Rails.application.routes.draw do
  
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :subs, except: [:destroy]

  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  
  resources :comments, only: [:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
