Rails.application.routes.draw do
  root to: redirect('admin')

  resources :purchases

  namespace :admin do
    root to: 'purchases#index'
    resources :promos
  end
end
