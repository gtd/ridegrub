Rails.application.routes.draw do
  get 'strava_token' => 'home#strava_token'
  root 'home#index'
end
