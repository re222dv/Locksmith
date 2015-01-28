Locksmith::Engine.routes.draw do
  root 'session#new'

  get    'signin'   => 'session#new'
  post   'signin'   => 'session#create'
  delete 'signout'  => 'session#destroy'

  get 'signup'  => 'users#new'
  post 'signup'  => 'users#create', as: :users
end
