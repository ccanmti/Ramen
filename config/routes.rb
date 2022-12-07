Rails.application.routes.draw do
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # お店用
  devise_for :shops,skip: [:passwords], controllers: {
    registrations: "shop/registrations",
    sessions: 'shop/sessions'
  }

  # 管理者用
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  #Admin側routing
  namespace :admin do
    get 'homes/top'
    resources :genres, only: [:index,:edit,:new,:update,:destroy,:create]
    resources :shops,  only: [:index,:edit,:show,:update,:destroy]
    resources :customers,  only: [:index,:edit,:update]
  end

  #shop側routing
  namespace :shop do
    get   'shops/my_shop'          => 'shops#show'
    get   'shops/information/edit' => 'shops#edit'
    patch 'shops/information'      => 'shops#update'
    get   'shops/unsubscribe'      => 'shops#unsubscribe'
    patch 'shops/withdraw'         => 'shops#withdraw'
    resources :products,  only: [:new,:index,:edit,:show,:update,:destroy,:create]
    resources :items,  only: [:new,:index,:edit,:update,:destroy,:create]
    resources :comments,  only: [:index,:destroy]
  end

  #public側routing
  scope module: :public do
    root :to =>"homes#top"
    get "about"=>"homes#about"
    get   'customers/my_page'          => 'customers#show'
    get   'customers/information/edit' => 'customers#edit'
    patch 'customers/information'      => 'customers#update'
    get   'customers/unsubscribe'      => 'customers#unsubscribe'
    patch 'customers/withdraw'         => 'customers#withdraw'
    delete 'cart_items/destroy_all'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :shops,  only: [:index,:show] do
      resources :comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    resources :favorites, only: [:index]
    resources :comments, only: [:index,:edit,:update,:destroy]
    resources :products,  only: [:index,:show]
    resources :cart_items,  only: [:index,:create,:update,:destroy]
    resources :items,  only: [:show]
    resources :orders, only: [:new,:create,:index,:show]
    resources :genres,  only: [:index,:show]
  end
end
