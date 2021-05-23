Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  resources :items, except: [:index] do
    resources :orders, only: %i[index create]
  end
  resources :cards, only: %i[index new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
