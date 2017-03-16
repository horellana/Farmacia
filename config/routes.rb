Rails.application.routes.draw do
  get 'quotations/index'

  get 'foo/login'
  get 'foo/index'

  # resources :cotizaciones

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'farmacia#index'

  resources :providers
  resources :categories
  resources :medicinal_ingredients
  resources :presentations
  resources :clients
  resources :transactions do
    get 'ticket'
  end
  resources :box_movements

  resources :clients do
  get :autocomplete_client_rut, on: :collection
  end

  resources :clients do
    get :autocomplete_client_name, on: :collection
  end

  resources :products do
    get :autocomplete_product_name, on: :collection
  end

  resources :presentations do
    get :autocomplete_presentation_name, on: :collection
  end

  resources :medicinal_ingredient do
    get :autocomplete_medicinal_ingredient_name, on: :collection
  end

  resources :categories do
    get :autocomplete_category_description, on: :collection
  end

  resources :providers do
    get :autocomplete_provider_name, on: :collection
  end

  get 'search_product/index'
  get 'search_presentation/index'
  get 'search_category/index'
  get 'search_provider/index'
  get 'search_client/index'
  get 'search_medicinal_ingredient/index'


  get 'search/users', to: 'search_users#index', as: 'search_users'
  get 'search/products', to: 'search_product#index', as: 'search_products'
  get 'search/presentations', to: 'search_presentation#index', as: 'search_presentations'
  get 'search/categories', to: 'search_category#index', as: 'search_categories'
  get 'search/providers', to: 'search_provider#index', as: 'search_providers'
  get 'search/clients', to: 'search_client#index', as: 'search_clients'
  get 'search/medicinal_ingredients', to: 'search_medicinal_ingredient#index', as: 'search_medicinal_ingredients'


  resources :users

   scope :session do
     devise_for :users, controllers: { sessions: 'users/sessions',
                                       registrations: 'users/registrations' }

    put :rut, to: 'rut#update', as: 'set_rut'
    put :name, to: 'name#update', as: 'set_name'
  end

  resources :cart do
    resources :cart_item
  end
end
