Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"

  scope module: :public do
    get "customers/my_page" =>"customers#show"
    resource :customers, only: [:edit, :update] do
      collection do #id付与はしない
      get 'unsubscribe' #退会画面
      patch 'withdraw' #is_deletedを更新する
      end
    end
    # get "customers/unsubscribe" => "customers#unsubscribe"
    # get "customers/withdraw" => "customers#withdraw"
  end

  #顧客側でいじるため、デフォルトから変更
  devise_for :customers, :controllers => {
     :sessions => 'public/sessions'
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
