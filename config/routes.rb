Rails.application.routes.draw do
    resources :transaction
    get '/:id' => 'transaction#show'
end
