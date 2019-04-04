Rails.application.routes.draw do
  get 'pages/about'
  root to: redirect('/events')
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
