Rails.application.routes.draw do
  resources :categories
  resources :movies
  
  devise_for :admin_users, ActiveAdmin::Devise.config  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  ActiveAdmin.routes(self)

  get 'home/index'
  get 'film/:id',controller: :home, action: :film
  post '/rate' => 'rater#create', :as => 'rate'
  
  root "home#index"
  # get '*path' => redirect('/')
  get '*all', to: 'application#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
