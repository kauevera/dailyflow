Rails.application.routes.draw do
  # rotas de login
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # rotas de cadastro de usuario
  get  'signup', to: 'users#new'
  post 'users',  to: 'users#create'
  resources :users, only: [:new, :create]

  # rotas de tarefas
  resources :tasks

  # rota principal
  root "tasks#index" 
end