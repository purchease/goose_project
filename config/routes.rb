Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  # root to: 'homepage#index', :id => '1'
  match 'homepage#index/:uuid' => 'homepage#index', :as => :root

  resources :games
  resources :players

  namespace :api do
    post 'events', to: 'events#receive_events'
  end

  post 'rolls', to: 'dices#rolls'
end
