Rails.application.routes.draw do
  resources :activities, only: [:index, :show]
  get 'strava_token' => 'home#strava_token'
  root 'home#index'
end
