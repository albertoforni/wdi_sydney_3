BookApp::Application.routes.draw do

  resources :books

  resources :authors
	
	root :to => 'authors#index' #to controller for authors, and action goes to index

end
