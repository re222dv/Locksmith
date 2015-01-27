Locksmith::Engine.routes.draw do
  root 'users#new'

  get 'signup'  => 'users#new'
  post 'signup'  => 'users#create', as: :users
end
