EvobotProxy::Application.routes.draw do
  resources :robots, param: :name do
    member do
      post :location
    end
  end
  get '/', to: "robots#index"
end
