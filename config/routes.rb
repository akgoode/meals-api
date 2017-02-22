# frozen_string_literal: true
Rails.application.routes.draw do
  resources :ingredients, only: [:create, :index, :show]
  resources :meals, except: [:new, :edit]
  resources :requirements, only: [:create]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show, :create]
end
