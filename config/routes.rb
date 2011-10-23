HitTracker::Application.routes.draw do
  devise_for :users
  resources :users
  match 'profile' => 'users#profile', :as => "profile"

  resources :hits

  match 'media' => "media#index"
  resources :reporters
  resources :media_outlets
  
  resources :press_releases
  
  match 'locations' => "locations#index"
  resources :regions
  resources :chapters
  
  resources :tags

  root :to => 'hits#index'
end
