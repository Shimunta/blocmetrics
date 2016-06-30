Rails.application.routes.draw do

  resources :registered_applications

  devise_for :users

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflgiht', via: [:options]
    resources :events, only: [:create]
  end

  get 'welcome/index'

  get 'welcome/show'

  root 'welcome#index'
end
