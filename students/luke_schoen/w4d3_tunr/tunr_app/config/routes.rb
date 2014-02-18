TunrApp::Application.routes.draw do

  resources :playlists

# default structure shown below is generated but requires long routes:

  # get "pages/about_us"
  # get "pages/contact_us"
  # get "pages/privacy"
  # get "pages/terms_and_cond"
 

# chagne to short routes achieved as follows:

get "about_us" => "pages#about_us"
get "contact_us" => "pages#contact_us"
get "privacy" => "pages#privacy"
get "terms_and_cond" => "pages#terms_and_cond"

  resources :artists do
  	resources :albums, shallow:true
	resources :songs, shallow:true
  end

  resources :albums do
	resources :songs, shallow:true
  end

  resources :albums
  resources :songs
	
  root :to => 'artists#index' 

  #to controller for artists, and action goes to index

end

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