Rails.application.routes.draw do
  root 'application#index'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users

  resources :payment do
    collection do
      post 'create_card'
    end
  end

  resource :collection
  resources :order
end
