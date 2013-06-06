TweetClock::Application.routes.draw do
  resources :tweets
  resources :profiles, only: :show

  get '/app', to: 'app#index'
  get '/auth/:provider/callback' => 'sessions#create', as: :signin
  match "/signout" => "sessions#destroy", as: :signout

  root to: 'home#index'
end
