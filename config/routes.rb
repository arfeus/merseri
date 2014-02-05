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
  match '/printing/add_collection',   to: 'printing#add_collection',   via: 'get', as: 'add_collection'
  match '/printing/print_collection', to: 'printing#print_collection', via: 'get', as: 'print_collection' 
  match '/printing/print_all',        to: 'printing#print_all',        via: 'get', as: 'print_all'
  match '/printing/print_selected',   to: 'printing#print_selected',   via: 'get', as: 'print_selected'
  match '/help',                    to: 'welcome#help',        via: 'get'
  match '/about',                   to: 'welcome#about',       via: 'get'
  match '/contact',                 to: 'welcome#contact',     via: 'get'
  
  match '/on',   to: 'printing#adminon',   via: 'get', as: 'adminon'
  match '/off',   to: 'printing#adminoff',   via: 'get', as: 'adminoff'
  
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
