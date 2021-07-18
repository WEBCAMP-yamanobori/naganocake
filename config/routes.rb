Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"
  

  namespace :admin do
    root :to => "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

end
