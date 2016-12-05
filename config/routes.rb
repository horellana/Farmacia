Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'farmacia#index'

  resources :user
  # resources :transactions

  resources :shopping_cart

  # get 'search#products', to: :search_product, controller: 'search', action: :products, as: 'search_products'

  resources :products do
    get :autocomplete_product_name, :on => :collection
  end

  scope :devise do
    devise_for :user
  end
end
