Rails.application.routes.draw do
  
  get 'foo/login'
  get 'foo/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'farmacia#index'

  resources :user
  resources :providers
  resources :categories
  resources :doses
  resources :transactions
  resources :box_movements

  resources :clients do
  get :autocomplete_client_rut, on: :collection
  end

  resources :products do
    get :autocomplete_product_name, on: :collection
  end
  
  resources :doses do
    get :autocomplete_dose_kind, on: :collection
  end

  resources :medicinal_ingredient do
    get :autocomplete_medicinal_ingredient_name, on: :collection
  end
  
  resources :categories do
    get :autocomplete_category_description, on: :collection
  end

  get 'search_product/index'
  get 'search_dose/index'
  get 'search_category/index'


  get 'search/products', to: 'search_product#index', as: 'search_products'
  get 'search/doses', to: 'search_dose#index', as: 'search_doses'
  get 'search/categories', to: 'search_category#index', as: 'search_categories'
  
  
  
   scope :session do
    devise_for :users, controllers: { sessions: 'users/sessions' }

    put :rut, to: 'rut#update', as: 'set_rut'
    put :name, to: 'name#update', as: 'set_name'
  end

  resources :cart do
    resources :cart_item
  end
end
