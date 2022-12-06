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
    get   'shops/my_shop'          => "shops#show"
    get   'shops/information/edit' => 'shops#edit'
    patch 'shops/information'      => 'shops#update'
    get   'shops/unsubscribe'      => 'shops#unsubscribe'
    patch 'shops/withdraw'         => 'shops#withdraw'
    resources :products,  only: [:new,:index,:edit,:show,:update,:destroy,:create]
    resources :items,  only: [:new,:index,:edit,:update,:destroy,:create]
  end

  #public側routing
  scope module: :public do
    root :to =>"homes#top"
    get "about"=>"homes#about"
    resources :shops,  only: [:index,:show]
    resources :products,  only: [:index,:show]
    resources :cart_items,  only: [:index,:create,:update,:destroy]
  end
end
