MomaApp::Application.routes.draw do

	resources :artists do
		resources :paintings
	end

	resources :paintings

	#resources pre-populases instead of manually having to do the full crud declarations (i.e. 7 OFF them i.e. get '/artists/:id' => 'artists#show'

	#root :to => 'pages#home' #here you would need to create a pages_controller.rb file (which does not have to use resources, but may just have the menu or something, and link it to home.html.erb

	root :to => 'artists#index' #to controller for artist, and action goes to index
	
end
