Rails.application.routes.draw do
  devise_for :logs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  # get 'users'      => 'users#index'
  # get 'users/new'  =>  'users#new'
  # post'users'      =>  'users#create'
  # delete  'users'  => 'users#destroy'
  # patch   'users/:id'  => 'users#update'
  # get   'users/:id/edit'  => 'users#edit'
  # get   'logs/:id' =>  'logs#show'
  resources :users
  resources :logs, only: [:show]
end
