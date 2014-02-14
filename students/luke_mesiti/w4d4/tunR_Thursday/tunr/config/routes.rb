Tunr::Application.routes.draw do



  # get "pages/about_us"
  # get "pages/contact_us"
  # get "pages/privacy"
  # get "pages/term_and_conditions"



    resources :artists do 
       resources :albums, shallow:true
       resources :songs, shallow:true
    end

    resources :albums, only: [:index]
    resources :songs, only: [:index]

    resources :albums do
      resources :songs
    end

    # resources :artists

    # resources :albums

    # resources :songs

    resources :playlists
    
    get ":action" => "pages#:action"


    root :to => 'artists#index'
end
