Rails.application.routes.draw do
  root to: 'tours#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


  resource :cart, only: [:show]
  
  resources :charges

  resources :tours do
    resources :comments
    resources :tour_orders
  end

  resources :tour_orders do
    resources :orders
  end
end
