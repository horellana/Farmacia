Rails.application.routes.draw do
  # get :tickets, to: 'tickets#show', as: :ticket

  get 'historic_prices/index'

  get 'inventories/index'

  get 'low_stock/index'

  get 'quotations/index'

  get 'foo/login'
  get 'foo/index'

  root 'farmacia#index'

  resources :aggregates
  resources :sales
  resources :wastes
  resources :tickets

  resources :transactions do
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
    get :autocomplete_product_code, on: :collection
  end

  resources :presentations do
    get :autocomplete_presentation_name, on: :collection
  end

  resources :principles do
    get :autocomplete_principle_name, on: :collection
  end

  resources :categories do
    get :autocomplete_category_description, on: :collection
  end

  resources :laboratories do
    get :autocomplete_laboratory_name, on: :collection
  end

  resources :providers do
    get :autocomplete_provider_name, on: :collection
  end

  resources :offices do
    get :autocomplete_office_address, on: :collection
  end
  
  resources :aggregates do
    get :autocomplete_aggregates_product_code, on: :collection
  end

  get 'search/users', to: 'search_users#index', as: 'search_users'
  get 'search/products', to: 'search_products#index', as: 'search_products'
  get 'search/presentations', to: 'search_presentation#index', as: 'search_presentations'
  get 'search/categories', to: 'search_category#index', as: 'search_categories'
  get 'search/providers', to: 'search_provider#index', as: 'search_providers'
  get 'search/clients', to: 'search_client#index', as: 'search_clients'
  get 'search/principles', to: 'search_principle#index', as: 'search_principles'
  get 'search/laboratories', to: 'search_laboratory#index', as: 'search_laboratories'
  get 'search/offices', to: 'search_office#index', as: 'search_offices'
  get 'search/wastes', to: 'search_waste#index', as: 'search_wastes'
  get 'search/aggregates', to: 'search_aggregate#index', as: 'search_aggregates'


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
