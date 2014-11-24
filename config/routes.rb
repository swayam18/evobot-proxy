EvobotProxy::Application.routes.draw do
  resources :robots, param: :name do
    member do
      post :location
      post :error
      get :errors
      get :locations
    end
  end
  get '/', to: "home#index"
  get '/about', to: "home#about"
end
