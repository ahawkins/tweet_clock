TweetClock::Application.routes.draw do
  resources :tweets


  root to: 'home#index'
end
