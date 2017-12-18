Rails.application.routes.draw do
  root to: 'tours#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


  resources :tours do
    resources :tour_orders
    resources :comments
  end

  resources :tour_orders do
      resources :orders
  end

end
