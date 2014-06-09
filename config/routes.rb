# -*- encoding : utf-8 -*-
Bj::Application.routes.draw do
  # 会员注册、登录、退出、注销
  devise_for :users do
    get "sign_in", :to => "users/sessions#new"
    post "sign_in", :to => "users/sessions#create"
    get :sign_up, :to => 'users/registrations#new'
    post :sign_up, :to => 'users/registrations#create'
  end

    # ADMIN
  namespace :admin do
    resources :catalogs do
      collection do
        get 'selects'
      end
    end
    resources :articles
    resources :roles
    resources :users
    resources :pictures
  end

  resources :articles, :only => ["show", "index"]
  resources :catalogs, :only => ["show"]

  root :to => "home#bj_index"
  get 'admin' => "admin/home#index"
  get 'dynamic_selects' => "main#selects"
  # 富文本编辑器图片上传
  post 'kindeditor/upload'
  # END ADMIN

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
