Merseri::Application.routes.draw do

  resources :items do
    resources :tags
  end

  resources :actings
  

  resources :users do
    member do
      get :mers
      get :activities
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :mers do
    resources :tags
    resources :comments
  end
  
  resources :mers do
    member do
      put :vote_up
      put :vote_down
      get :add_collection
      get :remove_this_collection
    end
  end
  
  resources :activities do
    member do
      get :my_act
    end
  end
  
  
  
  root  'welcome#welcome'
  match '/signup',                    to: 'users#new',                 via: 'get'
  match '/signin',                    to: 'sessions#new',              via: 'get'
  match '/signout',                   to: 'sessions#destroy',          via: 'delete'
  match '/search/mers',               to: 'mers#search',               via: 'get', as: 'search_mers'
  match '/search/items',              to: 'items#search',              via: 'get', as: 'search_items'
  
  match '/printing/print_collection', to: 'printing#print_collection', via: 'get', as: 'print_collection' 
  match '/printing/print_all',        to: 'printing#print_all',        via: 'get', as: 'print_all'
  match '/printing/collection_email', to: 'printing#collection_email', via: 'get', as: 'collection_email'
  match '/printing/remove_collection',to: 'printing#remove_collection',via: 'get', as: 'remove_collection'
 
  match '/action',                    to: 'activities#action',         via: 'get', as: 'action'
  match '/history',                   to: 'activities#history',        via: 'get', as: 'history'
  match '/on_acting',                 to: 'actings#on_acting',         via: 'get', as: 'on_acting'
 
  match '/help',                      to: 'welcome#help',              via: 'get', as: 'help'
  match '/about',                     to: 'welcome#about',             via: 'get'
  match '/contact',                   to: 'welcome#contact',           via: 'get'
  match '/newuser',                   to: 'welcome#newuser',           via: 'get', as: 'newuser'
  match '/welcome',                   to: 'welcome#welcome',           via: 'get', as: 'welcome'

  match '/notes_page',                     to: 'mers#notes_page',             via: 'get', as: 'notes_page'
  match '/timeline_page',                  to: 'timelines#timeline_page',          via: 'get', as: 'timeline_page'
  match '/inventory_page',                 to: 'items#inventory_page',         via: 'get', as: 'inventory_page'
  
  match '/users/:id/edit/on',   to: 'users#admin_on',    via: 'get', as: 'admin_on'
  match '/users/:id/edit/off',  to: 'users#admin_off',   via: 'get', as: 'admin_off'
  
  get '/mers/tags/:tag',    to: 'mers#index',   as: :tag_mers
  get 'items/tags/:tag',    to: 'items#index',   as: :tag_items

  
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
