Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"


  scope module: :public do
    get "customers/my_page" =>"customers#show"
    resource :customers, only: [:edit, :update]
    get "customers/unsubscribe" => "customers#unsubscribe"
    get "customers/withdraw" => "customers#withdraw"
    resources :items, only: [:index, :show]
    resources :addresses
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
   
  end

  devise_for :customers

  namespace :admin do
    root :to => "homes#top"
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end

  devise_for :admins

end
