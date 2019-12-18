Rails.application.routes.draw do
  get 'home/set_parameter'
  get 'home/filter'
  get 'home/index'
  get 'home/empty'

  root 'home#index'

  post 'home/filter', to: 'home#filter', as: 'filter'
  post 'home/set_parameter', to: 'home#set_parameter', as: 'set_parameter'

  resources :animal, only: [:index, :show]
  resources :home, only: [:index, :filter, :empty]
  resources :publications, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
