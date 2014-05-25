Rails.application.routes.draw do
  root :to => 'assets#index'
  get 'assets/index'

  resource :users, only: [:create, :show]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end
end
