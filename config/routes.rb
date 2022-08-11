Rails.application.routes.draw do

  devise_for :users
  get 'home/about' => 'homes#about', as: "about_home"

  root to: 'homes#top'

  resources :books, only: [:index, :show]

end
