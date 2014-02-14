HappiRails::Application.routes.draw do

  # resources :shelters do
  #   resources :clients
  #   resources :animals
  # end

  resources :shelters
  resources :clients
  resources :animals

  # root :to => 'shelters#index'

end