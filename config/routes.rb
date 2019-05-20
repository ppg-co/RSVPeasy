Rails.application.routes.draw do
  resources :locations

  get 'pages/about'
  root to: redirect('/events')
  resources :events
  devise_for :users

  mount ReportsKit::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
