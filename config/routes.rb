Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  #resources :items,only:[:new,:create,:edit,:update,:show] do
    #resources :orders, only:[:index,:create]
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
