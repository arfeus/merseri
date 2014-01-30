Merseri::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :mers do
    resources :tags
    resources :comments
  end
  
  root  'welcome#index'
  match '/signup',                   to: 'users#new',                via: 'get'
  match '/signin',                   to: 'sessions#new',             via: 'get'
  match '/signout',                  to: 'sessions#destroy',         via: 'delete'
  match '/printing/addCollection',   to: 'printing#addCollection',   via: 'get', as: 'addCollection'
  match '/printing/printCollection', to: 'printing#printCollection', via: 'get', as: 'printCollection' 
  match '/printing/printAll',        to: 'printing#printAll',        via: 'get', as: 'printAll'
  match '/printing/printSelected',   to: 'printing#printSelected',   via: 'get', as: 'printSelected'
  
  get 'tags/:tag',    to: 'mers#index',   as: :tag

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
