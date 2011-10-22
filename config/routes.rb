HitTracker::Application.routes.draw do
  devise_for :users
  resources :users

  resources :hits

  get 'media' => "media#index"
  resources :reporters
  resources :outlets
  
  resources :releases
  
  get 'locations' => "locations#index"
  resources :regions
  resources :chapters
  
  resources :tags

  root :to => 'dashboard#index'
end
