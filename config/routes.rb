KegeratorstatUs::Application.routes.draw do
  devise_for :users

  resources :kegerators do
    resources :kegs
  end

  root :to => 'status#index'
end
