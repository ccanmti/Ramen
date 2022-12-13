Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  # admin用devise
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  # public用devise
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # shop用devise
  devise_for :shops,skip: [:passwords], controllers: {
    registrations: "shop/registrations",
    sessions: 'shop/sessions'
  }


  #Admin側routing
  namespace :admin do
    get 'homes/top'
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
    patch 'customers/:id/reunion' => 'customers#reunion', as: 'customer_reunion'
    patch 'shops/:id/withdraw' => 'shops#withdraw', as: 'shop_withdraw'
    patch 'shops/:id/reunion' => 'shops#reunion', as: 'shop_reunion'
    resources :genres, only: [:index,:edit,:new,:update,:destroy,:create]
    resources :shops,  only: [:index,:edit,:show,:update,:destroy]
    resources :customers,  only: [:index,:edit,:update,:show]
    resources :comments,  only: [:index,:destroy]
    resources :orders,  only: [:index,:show,:update]
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
    post 'orders/confirm'              => 'orders#confirm'
    get 'orders/complete'              => 'orders#complete'
    resources :deliveries, only: [:index,:edit,:create,:update,:destroy]
    resources :favorites, only: [:index]
    resources :comments, only: [:index,:edit,:update,:destroy]
    resources :products,  only: [:index,:show]
    resources :cart_items,  only: [:index,:create,:update,:destroy]
    resources :items,  only: [:show]
    resources :orders, only: [:new,:create,:index,:show]
    resources :genres,  only: [:index,:show]
    resources :shops,  only: [:index,:show] do
      resources :comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
  end

  #shop側routing
  namespace :shop do
    get   'shops/my_shop'          => 'shops#show'
    get   'shops/information/edit' => 'shops#edit'
    patch 'shops/information'      => 'shops#update'
    get   'shops/unsubscribe'      => 'shops#unsubscribe'
    patch 'shops/withdraw'         => 'shops#withdraw'
    patch 'businesshours/edit/update_all' => 'businesshours#update_all'
    resources :products,  only: [:new,:index,:edit,:show,:update,:destroy,:create]
    resources :items,  only: [:new,:index,:edit,:update,:destroy,:create]
    resources :comments,  only: [:destroy]
    resources :order_details,  only: [:index, :show]
    get 'comments', to: 'comments#index', as: 'comments_index'
    resources :businesshours
    resources :shops do
      member do
        get "businesshour"
      end
    end
  end
end
