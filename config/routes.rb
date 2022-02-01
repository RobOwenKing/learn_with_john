Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  devise_for :users, :path_prefix => 'd'
  resources :users, only: [ :index, :show, :edit, :update ]
  resources :students do
    resources :practiseds, only: [ :create ]
  end
  resources :practiseds, only: [ :destroy ]
  resources :topics, only: [:index, :new, :create, :edit, :update, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
