Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'weather_stations#index'
  get 'weather_stations/index.json' => 'weather_stations#index', constraints: { format: 'json' }
  get 'weather_stations/test/:state' => 'weather_stations#test'
end
