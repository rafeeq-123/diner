Rails.application.routes.draw do
	devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get "restaurants/user_stats"
  get "welcome/index"
  get "welcome/sponser"
	root "welcome#index"
  get "donations/credit"
  post "donations/add_credit"
  resources :restaurants do
    resources :comments
  	resources :votes
    resources :donations
    get "more_info", :on => :member
  end
  resources :restaurants
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
end
