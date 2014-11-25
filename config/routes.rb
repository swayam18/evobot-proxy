EvobotProxy::Application.routes.draw do
  resources :robots, param: :name do
    member do
      post :location
      post :error
      get :errors
      get :locations
    end
  end

  resources :camera, only:[] do
    collection do
      put :update
    end
  end
  get '/', to: "home#index"
  get '/about', to: "home#about"
  get '/fitness', to: "home#fitness"
  get '/snapshot', to: "home#snapshot"
end
