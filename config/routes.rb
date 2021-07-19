Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"


  namespace :admin do
    root :to => "homes#top"
    resources :genres, only: [:index, :edit, :create, :update] 
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end

end
