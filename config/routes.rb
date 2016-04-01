Rails.application.routes.draw do
  root to: redirect('admin')

  resources :purchases, only: [:new, :create]

  get 'promo/find' => 'promos#find_by_code'

  namespace :admin do
    root to: 'purchases#index'
    resources :promos
  end
end
