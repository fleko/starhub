Rails.application.routes.draw do
  post 'messages/create'

  get 'messages/new'

  get 'messages/index'

  get 'home/index'

  devise_for :customers, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :products do
    resources :reviews
    resources :issues
  end
end
