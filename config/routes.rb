Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'homepage#index'
  get 'homepage#index/:uuid' => 'homepage#index'

  # match "/patients/:id" => "patients#show"
  #
  # get 'homepage#index/:uuid' => 'homepage#index', :as => :root

  resources :games
  resources :players

  namespace :api do
    post 'events', to: 'events#receive_events'
  end

  post 'rolls', to: 'dices#rolls'
  post 'start_a_game', to: 'games#start_a_game'
  post 'end_game', to: 'games#end_game'

end
