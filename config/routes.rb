Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/users', to: 'users#show'
  get 'logout' => 'sessions#destroy'

  namespace :admin do
    resources :categories
    resources :images
  end

  resources :users do
    resources :ideas
  end

  resources :ideas do
    resources :images
  end

end
