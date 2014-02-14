TunR::Application.routes.draw do
  
  resources :artists, :shallow => true do
    resources :albums
    resources :songs
   end

   resources :albums do
   resources :songs, :only => :index
  end


   resources :songs, :only => :index
   resources :albums, :only => :index
   resources :pages

  root 'application#index'
  get ':action' => 'pages#:action'


  end
