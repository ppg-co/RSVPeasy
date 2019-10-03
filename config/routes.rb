Rails.application.routes.default_url_options[:host] = "XXX"
Rails.application.routes.draw do
  resources :todo_lists do
 resources :todo_items do
  member do
   patch :complete
  end
end
end
  root 'themes#index'
  get 'themes/index'
  get 'pages/about'
  get 'guestlists_imports/new'
  get 'guestlists_imports/create'
  resources :guestlists do
  collection do
    post :import
  end
end
  #resources :guestlists_imports, only: [:new, :create]
  resources :locations
resources :guests

  #root to: 'events#index'
  root to: redirect('/events')
  root to: redirect('/guestlists')
  root to: redirect('/pages/about')
  #get 'guestlists'
  resources :events do
    resources :guests
    resources :guestlists
    match '/landing_page', to:'events#landing_page', as: :landing_page, :via => [:get,:post]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
