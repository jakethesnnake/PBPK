Rails.application.routes.draw do
  get 'home/filter'
  get 'home/index'
  get 'home/empty'
  root 'home#index'

  post 'home/filter', to: 'home#filter', as: 'filter'

  post 'home/set_animal', to: 'home#set_animal', as: 'set_animal'

  resources :animal, only: [:index, :show]
  resources :home, only: [:index, :filter, :empty]
  resources :publications, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
