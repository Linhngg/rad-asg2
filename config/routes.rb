Rails.application.routes.draw do
  root "news#index"
  post "signup", :to => "users#new"
  post "login", :to => "sessions#login"
  post "logout", :to => "sessions#logout"
  get "home", :to => "sessions#home"
  get "profile", :to => "sessions#profile"
  get "setting", :to => "sessions#setting"
  post 'sessions/login_attempt'
  post "sessions/signup_and_login_attempt"

  get 'sessions/login'
  get "login", :to => "sessions#login"

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  get 'users/new'
  post 'users/create'
  
  get "comments", :to => "comments#index"
  
  get "submit", :to => "news#submit"
  
  post "submit", :to => "news#postNews"
  
  get "item", :to => "news#item"
  
  post "comment", :to => "comments#postComment"
  
  get "v0/item/:id", :to => "api#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
