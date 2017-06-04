Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  ##root 'products#index'

#购物车下资源和操作
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

#管理员下的资源和操作
  namespace :admin do
    resources :products
    resources :categories
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

#商品下的操作
  resources :products do
    #评论资源
    resources :comments
    member do
      post :add_to_cart
      post :join
      post :quit
    end
    collection do
      #关键字查找
      get :search_word
    end
  end

#订单下的操作
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

#用户下资源和操作
  namespace :account do
    resources :orders
  end

end
