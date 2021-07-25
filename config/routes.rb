Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"


  scope module: :public do
    get "customers/my_page" =>"customers#show"
    resource :customers, only: [:edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end

      post "/orders/confirm" => "orders#confirm"
      get "/orders/complete" => "orders#complete"
      resources :orders, only: [:new, :create, :index, :show, :destroy]
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    end

    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
  end

  devise_for :customers , :controllers => {
     :sessions => 'public/customers/sessions',
     :registrations => 'public/customers/registrations'
  }

  #devise_for :customers

  namespace :admin do
    root :to => "homes#top"
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end

  devise_for :admins

end
