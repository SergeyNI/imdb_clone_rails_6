Rails.application.routes.draw do
  root "home#index"
  get 'home/index'
  # get 'movie/:id',controller: :movie, action: :show
  
  get 'films/:id',controller: :films, action: :show
  resources :categories
  resources :movies
  post '/rate' => 'rater#create', :as => 'rate' #route addded by gem ratyrate
  devise_for :admin_users, ActiveAdmin::Devise.config  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  ActiveAdmin.routes(self)

  
  
  
  get '*all', to: 'application#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
