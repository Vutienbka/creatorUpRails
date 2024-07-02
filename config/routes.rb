Rails.application.routes.draw do
  direct :rails_direct_uploads do
    route_for(:rails_direct_uploads)
  end

  root :to => "homes/homes#index", controller: "HomesController"
  devise_for :users

  scope module: "users" do
    resources :posts do
      resources :elements
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
