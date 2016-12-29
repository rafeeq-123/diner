Rails.application.routes.draw do
	devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get "restaurants/user_stats"
  get "welcome/index"
  get "welcome/sponser"
	root "welcome#index"
  resources :restaurants do
  	resources :votes
    resources :donations
  end
  resources :restaurants
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
end
