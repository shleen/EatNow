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

  resources :menu_items

  resource :collection
  resources :order

  resources :order_item do
    post 'completed', to: 'order_item#completed'
  end
end
