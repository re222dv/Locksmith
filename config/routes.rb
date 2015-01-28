Locksmith::Engine.routes.draw do
  root 'applications#index'

  get 'application/new'         => 'applications#new',         as: :new_application
  post 'application'            => 'applications#create',      as: :create_application
  get 'application/:id'         => 'applications#show',        as: :application
  post 'application/:id'        => 'applications#regenerate',  as: :regenerate
  get 'application/:id/delete'  => 'applications#delete',      as: :delete_application
  delete 'application/:id'      => 'applications#destroy',     as: :destroy_application

  get    'signin'   => 'session#new'
  post   'signin'   => 'session#create'
  delete 'signout'  => 'session#destroy'

  get 'signup'   => 'users#new'
  post 'signup'  => 'users#create', as: :users
end
