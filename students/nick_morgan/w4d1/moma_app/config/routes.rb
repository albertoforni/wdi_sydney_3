MomaApp::Application.routes.draw do

  resources :artists 

  # ^this generates the seven paths of /artist
  # they are:

  # artists_path   GET   /artists(.:format)  artists#index
  # POST   /artists(.:format)  artists#create
  # new_artist_path  GET   /artists/new(.:format)  artists#new
  # edit_artist_path   GET   /artists/:id/edit(.:format)   artists#edit
  # artist_path  GET   /artists/:id(.:format)  artists#show
  # PATCH  /artists/:id(.:format)  artists#update
  # PUT  /artists/:id(.:format)  artists#update
  # DELETE   /artists/:id(.:format)  artists#destroy

  resources :paintings

  root :to => 'artists#index'

end
