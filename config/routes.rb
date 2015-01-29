Locksmith::Engine.routes.draw do
  root 'applications#index'

  resources :applications, only: [:new, :create, :show, :destroy]
  post 'applications/:id'        => 'applications#regenerate',  as: :regenerate
  get 'applications/:id/delete'  => 'applications#delete',      as: :delete_application

  get    'signin'   => 'session#new'
  post   'signin'   => 'session#create'
  delete 'signout'  => 'session#destroy'

  get 'signup'   => 'users#new'
  post 'signup'  => 'users#create', as: :users

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :applications, only: [:show, :destroy]
    post 'applications/:id'        => 'applications#regenerate',  as: :regenerate
    get 'applications/:id/delete'  => 'applications#delete',      as: :delete_application
  end
end
