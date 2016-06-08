Rails.application.routes.draw do
  root 'cities#index'

  resources :cities do
    resources :cottages
  end
end
