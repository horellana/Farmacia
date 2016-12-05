Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'farmacia#index'

  resources :user
  resources :transactions
  resources :product

  scope :devise do
    devise_for :user
  end
end
