KegeratorstatUs::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  resources :kegerators do
    resources :kegs
  end
  resources :beer_requests, :only => [:new, :create]

  match 'status/:login' => 'status#for_user', :as => :status
  match 'content/:content' => "content#show", :as => :content

  root :to => 'status#index'
end
