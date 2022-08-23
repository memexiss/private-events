Rails.application.routes.draw do
  devise_for :users
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
  get '/user/:id', to: 'users#profile', as: :user
  resources :events do
    member do
      get 'invitation'
      get 'cancel_invitation'
    end
  end
end
