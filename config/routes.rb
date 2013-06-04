TweetClock::Application.routes.draw do
  resources :tweets

  get '/app', to: 'app#index'
  post '/auth/:provider/callback' => 'sessions#create', as: :signin
  match "/signout" => "sessions#destroy", as: :signout

  root to: 'home#index'
end
