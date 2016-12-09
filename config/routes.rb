Rails.application.routes.draw do
  get 'search_product/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'farmacia#index'

  resources :user
  resources :cart
  resources :providers
  resources :clients

  resources :products do
    get :autocomplete_product_name, on: :collection
  end

  resources :medicinal_ingredient do
    get :autocomplete_medicinal_ingredient_name, on: :collection
  end

  resources :transactions
  resources :products

  scope :devise do
    devise_for :user
  end

  get 'search/products', to: 'search_product#index', as: 'search_products'
end
