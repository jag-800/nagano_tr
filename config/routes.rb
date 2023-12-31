Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :customers, only: [:show, :edit, :update, :confirm]
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    get 'homes/top'
    resources :customers, only: [:index, :show, :edit]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
