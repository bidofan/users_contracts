Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :conditions, only: %i[create show]
    get '/calculate_conditions' => 'conditions#calculate_conditions', as: :calculate_conditions
  end
end
