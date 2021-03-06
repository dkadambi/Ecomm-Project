EcommProject::Application.routes.draw do
  
  resources :abouts

  resources :contacts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :provinces

  resources :customers

  resources :orders

  resources :lineitems

  resources :categories

  resources :products
  
  get 'store/:id', to: 'store#show', as: 'store'
  
  get '/search' => 'store#search', as: 'search'
  
  get '/search_results' => 'store#search_results', as: 'search_results'
  
  get 'checkout/:id' => 'products#accept_and_redirect', as: 'checkout'
  
  get 'remove/:id' => 'products#delete_item', as: 'remove_cart_item'
  
  post 'checkout' => 'orders#check_out', as: 'checkout_complete'
  
  #get 'store/search', to: 'store#search', as: 'search'
  root 'store#index'

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
