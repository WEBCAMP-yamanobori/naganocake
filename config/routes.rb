Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"

  scope module: :public do
    resource :customers, only: [:show, :edit, :update]
    get "customers/unsubscribe" => "public/customers#unsubscribe"
    get "customers/withdraw" => "public/customers#withdraw"
  end

  devise_for :customers

  namespace :admin do
    root :to => "homes#top"
<<<<<<< HEAD
    resources :genres, only: [:index, :edit, :create, :update] 
=======
    resources :customers, only: [:index, :show, :edit, :update]
>>>>>>> origin/develop
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end

  devise_for :admins

end
