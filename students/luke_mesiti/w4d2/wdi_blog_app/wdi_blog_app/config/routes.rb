WdiBlogApp::Application.routes.draw do
 
    resources :posts do
        resources :comments
    end

    resources :comments
end
