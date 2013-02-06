Whiteboard::Application.routes.draw do

  resources :users
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]

  root to: "sessions#new"
  match '/signin', to: 'sessions#new'
  match '/signup', to: 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/aboutus', to: 'pages#about'
  match '/contact', to: 'pages#contact'
end
