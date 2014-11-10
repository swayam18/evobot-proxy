EvobotProxy::Application.routes.draw do
  resources :robots, param: :name do
    collection do
      post :location
    end
  end
  resources :positions, only: [:index,:create] do
    collection do
      get :predator
      get :prey
    end
  end
  get '/', to: "positions#index"
end
