TweetClock::Application.routes.draw do
  resources :tweets

  match 'app' => 'app#index'

  root to: 'home#index'
end
