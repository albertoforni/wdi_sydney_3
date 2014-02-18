BlogApp::Application.routes.draw do

# setup routes with sub-resources

	resources :posts do
		resources :comments 
	end

	root :to => 'posts#index' #to controller for home, and action goes to index

end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end