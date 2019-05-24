Rails.application.routes.default_url_options[:host] = "XXX"
Rails.application.routes.draw do
  get 'guestlists_imports/new'
  get 'guestlists_imports/create'
  resources :guestlists do
  collection do
    post :import
  end
end
  #resources :guestlists_imports, only: [:new, :create]
  resources :locations

  get 'pages/about'
  #root to: 'events#index'
  root to: redirect('/events')
  root to: redirect('/guestlists')
  #get 'guestlists'
  resources :events
  devise_for :users

  mount ReportsKit::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
