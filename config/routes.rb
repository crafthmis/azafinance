Rails.application.routes.draw do
  resources :users do
    resources :cheets
    resources :dashboard, only: [:index]
  end
end
