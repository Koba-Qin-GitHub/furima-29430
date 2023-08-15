Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # resources :items
  # resources :shopping_logs
  resources :items do
    resources :shopping_logs, only:[:index, :create]
  end

end
