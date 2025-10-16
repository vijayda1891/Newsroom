Rails.application.routes.draw do
  devise_for :users
  get "dashboard/index"
  get "dashboard/user_dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "dashboard#index"
  resources :book_reviews do 
    collection do 
      get :fiction
      get :history
      get :non_fiction
      get :mystery
      get :science
      get :romance
      get :spirituality
      get :fantasy
    end
  end
  resources :game_reviews
  resources :articles do
    collection do 
      get :culture
      get :travel
      get :sport
    end 
  end
  resources :news do 
    collection do 
      get :world
      get :sport
      get :regional
      get :tech
      get :business
      get :entertainment
    end
  end
end
