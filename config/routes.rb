Rails.application.routes.draw do
	root "restaurants#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :restaurants
end
