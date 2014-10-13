Rails.application.routes.draw do
  
  resources :users, except: [:destroy]
  resources :sessions, only: [:create, :new, :destroy]

  resources :farm_details, except: [:show, :edit, :update, :destroy] do
      get 'edit_selected' , on: :collection
      put 'update_selected', on: :collection
  end

  resources :soils, except: [:show, :edit, :update, :destroy] do
    get 'edit_selected', on: :collection
    put 'update_selected', on: :collection
  end

  resources :crops, except: [:show, :edit, :update, :destroy] do
    get 'edit_selected', on: :collection
    put 'update_selected', on: :collection
  end

  resources :reports do
    get 'farm', on: :collection
    get 'crop', on: :collection
    get 'soil', on: :collection
  end
  
  root to: "pages#home"
  
  match '/contact',       to: 'pages#contact',    :via => [:get]
  match '/about',         to: 'pages#about',      :via => [:get]
  match '/help',          to: 'pages#help',       :via => [:get]
  match '/signup',        to: 'users#new',        :via => [:get]
  match '/signin',        to: 'sessions#new',     :via => [:get]
  match '/signout',       to: 'sessions#destroy', :via => [:get]


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
