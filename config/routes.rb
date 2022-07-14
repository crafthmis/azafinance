Rails.application.routes.draw do
  resources :users do
    resources :cheets
  end
end
