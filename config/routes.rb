
Rails.application.routes.draw do
root 'brands#index'
  resources :brands, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :products

end



