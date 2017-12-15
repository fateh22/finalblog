Rails.application.routes.draw do

  get 'room/show'

  	devise_for :users
	root 'articles#index'
	resources :articles do
		resources :comments
	end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
