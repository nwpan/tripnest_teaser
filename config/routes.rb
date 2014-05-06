Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resource :users, only: [:create, :show]
end
