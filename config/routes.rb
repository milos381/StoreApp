Rails.application.routes.draw do
  root 'welcome#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :models
  resources :purchases
  resources :phones
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
