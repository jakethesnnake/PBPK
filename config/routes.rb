Rails.application.routes.draw do
  root 'home#index'

  # citations
  get 'citations/show', to: 'citations#show', as: 'show_citations'

  # home
  get 'home/set_animal'
  get 'home/set_parameter'
  get 'home/filter'
  get 'home/index'
  get 'home/empty'

  post 'home/filter', to: 'home#filter', as: 'filter'
  post 'home/set_parameter', to: 'home#set_parameter', as: 'set_parameter'
  post 'home/set_animal', to: 'home#set_animal', as: 'set_animal'

  resources :animal, only: [:index, :show]
  resources :home, only: [:index, :filter, :empty]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
