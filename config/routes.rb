KegeratorstatUs::Application.routes.draw do
  devise_for :users

  resources :kegerators

  root :to => 'status#index'
end
