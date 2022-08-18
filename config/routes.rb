Rails.application.routes.draw do

  devise_for :users

  # get 'users/:id' => 'users#show', as: "show_user"
  # get 'users' => 'users#index', as: "index_user"

  get 'home/about' => 'homes#about', as: "about_home"

  root to: 'homes#top'

  resources :books, only: [:index, :show]

end
