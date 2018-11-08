Rails.application.routes.draw do
  root 'application#index'

  devise_for :users

  resources :payment do
    collection do
      post 'create_card'
    end
  end
<<<<<<< HEAD
  resources :menu_items
=======

  resource :collection

  resources :order
>>>>>>> af95c7581d3d22707fdcaac1e712ec676ef1268a
end
