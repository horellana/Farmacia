Rails.application.routes.draw do
  get 'historic_prices/index'
  
  get 'inventories/index'

  get 'low_stock/index'

  get 'quotations/index'

  get 'foo/login'
  get 'foo/index'

  # resources :cotizaciones

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'farmacia#index'

  resources :providers
  resources :categories
  resources :principles
  resources :presentations
  resources :clients
  resources :laboratories
  resources :offices
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

  get 'search_product/index'
  get 'search_presentation/index'
  get 'search_category/index'
  get 'search_provider/index'
  get 'search_client/index'
  get 'search_principle/index'
  get 'search_laboratory/index'
  get 'search_office/index'



  get 'search/users', to: 'search_users#index', as: 'search_users'
  get 'search/products', to: 'search_product#index', as: 'search_products'
  get 'search/presentations', to: 'search_presentation#index', as: 'search_presentations'
  get 'search/categories', to: 'search_category#index', as: 'search_categories'
  get 'search/providers', to: 'search_provider#index', as: 'search_providers'
  get 'search/clients', to: 'search_client#index', as: 'search_clients'
  get 'search/principles', to: 'search_principle#index', as: 'search_principles'
  get 'search/laboratories', to: 'search_laboratory#index', as: 'search_laboratories'
  get 'search/offices', to: 'search_office#index', as: 'search_offices'



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
