Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :movies
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home/index'
  get 'film/:id',controller: :home, action: :film
  # get 'home/count_films'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
