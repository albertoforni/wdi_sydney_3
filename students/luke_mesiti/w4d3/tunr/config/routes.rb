Tunr::Application.routes.draw do
  resources :artists

  resources :albums

  resources :songs

  root :to => 'songs#index'
end
