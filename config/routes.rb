Rails.application.routes.draw do
  root to: 'tours#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


  resource :cart, only: [:show]

  resources :tour_orders

  resources :tours do
    resources :comments
  end
end
