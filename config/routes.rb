Rails.application.routes.draw do
 resources :contatos do
    collection { post :import }
  end
  root to: 'login#index'
  resources :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
