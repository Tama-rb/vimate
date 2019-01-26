Rails.application.routes.draw do
  root 'users#index'
  get  'auth/github/callback', to: 'sessions#create'
  get  '/logout',              to: 'sessions#destroy'
end
