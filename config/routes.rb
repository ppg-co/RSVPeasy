Rails.application.routes.default_url_options[:host] = "XXX"
Rails.application.routes.draw do

  root 'themes#index'
  get 'themes/index'
  get 'pages/about'
  get 'guestlists_imports/new'
  get 'guestlists_imports/create'
  get '/events/:event_id/guestlists/:id/response_page/:response', to: 'guestlists#response_page'

  #resources :guestlists_imports, only: [:new, :create]
  resources :locations
  #root to: 'events#index'
  root to: redirect('/events')
  root to: redirect('/guestlists')
  root to: redirect('/pages/about')
  #get 'guestlists'
  resources :events do
    resources :guestlists do
      #match '/response_page', to:'events#guestlist#response_page', as: :response_page, :via => [:get,:post]
      collection do
        post :import
      end
    end
    resources :todo_lists do
      resources :todo_items do
        member do
          patch :complete
        end
      end
    end

    match '/landing_page', to:'events#landing_page', as: :landing_page, :via => [:get,:post]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
