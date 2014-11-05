EvobotProxy::Application.routes.draw do
  resources :positions, only: [:index,:create] do
    collection do
      get :predator
      get :prey
    end
  end
  get '/', to: "positions#index"
end
