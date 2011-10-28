KegeratorstatUs::Application.routes.draw do
  devise_for :users

  resources :kegerators do
    resources :kegs
  end

  match 'status/:login' => 'status#for_user', :as => :status

  root :to => 'status#index'
end
