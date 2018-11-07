Rails.application.routes.draw do
  root 'application#index'

  devise_for :users

  resources :payment do
    collection do
      post 'create_card'
    end
  end
  resources :menu_items
end
