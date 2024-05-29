Rails.application.routes.draw do
  resources :orders, only: [:index, :create, :show] do
    resources :order_items, only: [:create]
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :type_of_analyses
  resources :analyses, only: [:index]
  resources :family_members, only: [:index, :new, :create] do
    collection do
      post :add_self
    end
  end
  resources :people
  resources :profiles
  resources :appointments, only: [:index, :show, :create]
  resources :appointments do
    member do
      patch :cancel
    end
  end
  resources :orders, only: [:show] do
    member do
      get 'new_appointment', to: "appointments#new"
    end
  end

  get 'pages/home'
  devise_for :users, controllers: { registrations: "registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root 'pages#home'
  # Defines the root path route ("/")
  # root "posts#index"
end
