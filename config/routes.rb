Rails.application.routes.draw do

  devise_for :users

  get 'home/about' => 'homes#about', as: "about_home"

  root to: 'homes#top'

  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :edit, :update]

  resources :users, only: [:index, :show, :edit, :update]

end
