Rails.application.routes.draw do

  mount Locksmith::Engine => "/locksmith"
end
