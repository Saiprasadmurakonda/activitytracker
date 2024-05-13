Rails.application.routes.draw do
  get 'url_receiver/receive_url'
  resources :timeds
  resources :blockeds
  devise_for :users
  resources :individuals
  # get 'home/index'
  root 'individuals#index'
  post '/receive_url', to: 'url_receiver#receive_url'
  get "up" => "rails/health#show", as: :rails_health_check
Rails.application.routes.draw do
  match '/receive_url', to: 'url_receiver#receive_url', via: [:get, :post]
end
Rails.application.routes.draw do
  post '/blockeds', to: 'blockeds#create'
end
Rails.application.routes.draw do
  post 'check_url', to: 'url_receiver#check_url'
end
end
