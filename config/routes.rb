Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  get "/edit", to: 'home#edit'
  patch '/update', to: 'home#update'

  resources :canvas_programs, path: :canvas


  resources :articles

  devise_scope :admin do
    get 'sign_in', to: 'devise/sessions#new'
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
